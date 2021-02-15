import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/models/user.dart';
import 'package:flutter_share/pages/search.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/post.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:flutter_share/data/instances.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  bool _isLoading = false;
  List<Post> _posts = [];
  List<String> _followingList = [];

  @override
  void initState() {
    super.initState();
    getTimeline();
    getFollowing();
  }

  Future getTimeline() async {
    setState(() {
      _isLoading = true;
    });

    QuerySnapshot snapshot = await timelineRef
        .doc(currentUser.id)
        .collection('timelinePosts')
        .orderBy('timestamp', descending: true)
        .get();

    List<Post> posts =
        snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    setState(() {
      _posts = posts;
    });

    setState(() {
      _isLoading = false;
    });
  }

  Future getFollowing() async {
    setState(() {
      _isLoading = true;
    });

    QuerySnapshot snapshot = await followingRef
        .doc(currentUser?.id)
        .collection('userFollowing')
        .get();

    setState(() {
      _followingList = snapshot.docs.map((doc) => doc.id).toList();
      _isLoading = false;
    });
  }

  Widget buildUsersToFollow() {
    return StreamBuilder(
      stream:
          usersRef.orderBy('timestamp', descending: true).limit(30).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return circularProgress(context);

        List<UserResult> userResults = [];
        snapshot.data.documents.forEach((doc) {
          User user = User.fromDocument(doc);

          if (currentUser.id == user.id) return;
          if (_followingList.contains(user.id)) return;

          userResults.add(UserResult(user: user));
        });

        return Container(
          color: Theme.of(context).accentColor.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_add,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Users to Follow',
                      style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Column(children: userResults),
            ],
          ),
        );
      },
    );
  }

  Widget buildTimeline() {
    if (_isLoading) return circularProgress(context);

    if (_posts.isEmpty && !_isLoading) return buildUsersToFollow();

    return ListView(
      padding: EdgeInsets.only(bottom: 10),
      children: _posts,
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: RefreshIndicator(
        onRefresh: () => getTimeline(),
        child: buildTimeline(),
      ),
    );
  }
}
