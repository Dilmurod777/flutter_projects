import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/data/instances.dart';
import 'package:flutter_share/models/user.dart';
import 'package:flutter_share/pages/edit_profile.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/post.dart';
import 'package:flutter_share/widgets/post_tile.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:flutter_svg/svg.dart';

enum PostsOrientation { GRID, LIST }

class Profile extends StatefulWidget {
  final String profileId;

  const Profile({
    Key key,
    this.profileId,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _currentUserId;
  bool _isLoading = false;

  bool _isFollowing = false;
  int _followersCount = 0;
  int _followingCount = 0;

  int _postsCount = 0;
  List<Post> _posts = [];

  PostsOrientation postsOrientation = PostsOrientation.GRID;

  void editProfile() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(currentUserId: _currentUserId)));

    setState(() {});
  }

  void handleUnfollowUser() {
    setState(() {
      _isFollowing = false;
    });

    followersRef.doc(widget.profileId).collection('userFollowers').doc(currentUser.id).get().then((doc) {
      if (doc.exists) doc.reference.delete();
    });
    followingRef.doc(currentUser.id).collection('userFollowing').doc(widget.profileId).get().then((doc) {
      if (doc.exists) doc.reference.delete();
    });

    activityFeedRef.doc(widget.profileId).collection('feedItems').doc(currentUser.id).get().then((doc) {
      if (doc.exists) doc.reference.delete();
    });
  }

  void handleFollowUser() {
    setState(() {
      _isFollowing = true;
    });

    followersRef.doc(widget.profileId).collection('userFollowers').doc(currentUser.id).set({});
    followingRef.doc(currentUser.id).collection('userFollowing').doc(widget.profileId).set({});

    activityFeedRef.doc(widget.profileId).collection('feedItems').doc(currentUser.id).set({
      'type': 'follow',
      'ownerId': widget.profileId,
      'username': currentUser.username,
      'userId': currentUser.id,
      'userProfileImg': currentUser.photoUrl,
      'timestamp': DateTime.now(),
    });
  }

  Widget buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  Widget buildProfileButton() {
    bool isProfileOwner = _currentUserId == currentUser.id;

    if (isProfileOwner) {
      return buildButton(
        text: "Edit Profile",
        function: editProfile,
      );
    } else if (_isFollowing) {
      return buildButton(text: "Unfollow", function: handleUnfollowUser);
    } else {
      return buildButton(text: 'Follow', function: handleFollowUser);
    }
  }

  Widget buildButton({String text, Function function}) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: FlatButton(
        onPressed: function,
        child: Container(
          width: 250,
          height: 27,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isFollowing ? Colors.white : Colors.blue,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: _isFollowing ? Colors.grey : Colors.blue),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isFollowing ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileHeader() {
    return FutureBuilder(
      future: usersRef.doc(_currentUserId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }

        User user = User.fromDocument(snapshot.data);
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildCountColumn("posts", _postsCount),
                            buildCountColumn("followers", _followersCount),
                            buildCountColumn("following", _followingCount),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildProfileButton(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  user.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  user.displayName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  user.bio,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildProfilePosts(BuildContext context) {
    if (_isLoading) return circularProgress(context);

    if (_posts.isEmpty) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/no_content.svg', height: 260),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'No Posts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
      );
    }

    if (postsOrientation == PostsOrientation.GRID) {
      List<GridTile> gridTiles = [];
      _posts.forEach((post) {
        gridTiles.add(GridTile(
          child: PostTile(post: post),
        ));
      });

      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: gridTiles,
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: _posts,
        ),
      );
    }
  }

  void setPostsOrientation(PostsOrientation orientation) {
    setState(() {
      postsOrientation = orientation;
    });
  }

  Widget buildTogglePostOrientation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.grid_on),
          color: postsOrientation == PostsOrientation.GRID ? Theme.of(context).primaryColor : Colors.grey,
          onPressed: () => setPostsOrientation(PostsOrientation.GRID),
        ),
        IconButton(
          icon: Icon(Icons.list),
          color: postsOrientation == PostsOrientation.LIST ? Theme.of(context).primaryColor : Colors.grey,
          onPressed: () => setPostsOrientation(PostsOrientation.LIST),
        ),
      ],
    );
  }

  void getFollowers() async {
    QuerySnapshot snapshot = await followersRef.doc(_currentUserId).collection('userFollowers').get();

    setState(() {
      _followersCount = snapshot.docs.length;
    });
  }

  void getFollowing() async {
    QuerySnapshot snapshot = await followingRef.doc(_currentUserId).collection('userFollowing').get();

    setState(() {
      _followingCount = snapshot.docs.length;
    });
  }

  void checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef.doc(widget.profileId).collection('userFollowers').doc(currentUser.id).get();

    setState(() {
      _isFollowing = doc.exists;
    });
  }

  void getProfilePosts() async {
    setState(() {
      _isLoading = true;
    });

    QuerySnapshot snapshot = await postsRef.doc(_currentUserId).collection('userPosts').orderBy("timestamp", descending: true).get();

    setState(() {
      _isLoading = false;
      _postsCount = snapshot.docs.length;
      _posts = snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    });
  }

  @override
  void initState() {
    _currentUserId = widget.profileId ?? currentUser?.id;

    getProfilePosts();
    getFollowers();
    getFollowing();
    checkIfFollowing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Profile'),
      body: ListView(
        children: [
          buildProfileHeader(),
          Divider(),
          buildTogglePostOrientation(),
          Divider(height: 0.0),
          buildProfilePosts(context),
        ],
      ),
    );
  }
}
