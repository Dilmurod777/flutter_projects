import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/models/user.dart';
import 'package:flutter_share/pages/activity_feed.dart';
import 'package:flutter_share/pages/create_account.dart';
import 'package:flutter_share/pages/profile.dart';
import 'package:flutter_share/pages/search.dart';
import 'package:flutter_share/pages/timeline.dart';
import 'package:flutter_share/pages/upload.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_share/data/instances.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isAuth = false;

  DateTime _timestamp = DateTime.now();

  int _currentPage = 0;
  PageController _pageController;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    timelineRef = FirebaseFirestore.instance.collection('timeline');
    usersRef = FirebaseFirestore.instance.collection('users');
    postsRef = FirebaseFirestore.instance.collection('posts');
    commentsRef = FirebaseFirestore.instance.collection('comments');
    activityFeedRef = FirebaseFirestore.instance.collection('feed');
    followersRef = FirebaseFirestore.instance.collection('followers');
    followingRef = FirebaseFirestore.instance.collection('following');
    storageRef = FirebaseStorage.instance.ref();
    googleSignIn = GoogleSignIn();

    _pageController = PageController(
      initialPage: _currentPage,
    );

    // listen to google sign in state change
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      handleSignIn(account);
    }, onError: (error) {
      // print("GoogleLoginError: $error");
    });

    // check for auth session
    googleSignIn
        .signInSilently(suppressErrors: false)
        .then((GoogleSignInAccount account) {
      handleSignIn(account);
    }).catchError((error) {
      // print("GoogleLoginError: $error");
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void handleSignIn(GoogleSignInAccount account) async {
    if (account != null) {
      await createUserInFirestore();
      setState(() {
        _isAuth = true;
      });

      configurePushNotifications();
    } else {
      setState(() {
        _isAuth = false;
      });
    }
  }

  void login() {
    googleSignIn.signIn();
  }

  void logout() {
    googleSignIn.signOut();
  }

  Future configurePushNotifications() async {
    GoogleSignInAccount user = googleSignIn.currentUser;

    if (Platform.isIOS) getiOSPermission();

    _firebaseMessaging.getToken().then((token) {
      // print("FirebaseMessaging token: $token");
      usersRef.doc(user.id).update({
        'androidNotificationToken': token,
      });
    });

    // print("Configuring push notifications");
    _firebaseMessaging.configure(
      // onLaunch: (Map<String, dynamic> message) async {},
      // onResume: (Map<String, dynamic> message) async {},
      onMessage: (Map<String, dynamic> message) async {
        // print("FirebaseMessaging onMessage(): $message");

        final String recipientId = message['data']['recipient'];
        final String body = message['notification']['body'];

        // print("RecipientId: $recipientId, UserId: ${user.id}");
        if (recipientId == user.id) {
          SnackBar snackBar = SnackBar(
            content: Text(
              body,
              overflow: TextOverflow.ellipsis,
            ),
          );

          ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
        }
      },
    );
  }

  Future getiOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(
      alert: true,
      sound: true,
      badge: true,
    ));

    _firebaseMessaging.onIosSettingsRegistered.listen((settings) {
      // print("Settings registered: $settings");
    });
  }

  Future createUserInFirestore() async {
    // check if user exists in users collection
    GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await usersRef.doc(user.id).get();

    // if user does not exist, redirect to create account page
    if (!doc.exists) {
      dynamic username = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateAccount()),
      );

      // create new user with given username
      await usersRef.doc(user.id).set({
        'id': user.id,
        'username': username,
        'photoUrl': user.photoUrl,
        'email': user.email,
        'displayName': user.displayName,
        'bio': '',
        'timestamp': _timestamp,
      });
      // make new user follow their own posts
      await followersRef
          .doc(user.id)
          .collection('userFollowers')
          .doc(user.id)
          .set({});

      doc = await usersRef.doc(user.id).get();
    }

    currentUser = User.fromDocument(doc);
  }

  void onPageChanged(int page) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    setState(() {
      _currentPage = page;
    });
  }

  void onTap(int page) {
    _pageController.animateToPage(
      page,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    );
  }

  Widget buildAuthScreen() {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Timeline(),
          ActivityFeed(),
          Upload(),
          Search(),
          Profile(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentPage,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera, size: 35)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }

  Widget buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'FlutterShare',
              style: TextStyle(
                fontFamily: 'Signatra',
                fontSize: 90,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_button.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
