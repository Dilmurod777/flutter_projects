import 'dart:async';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/data/instances.dart';
import 'package:flutter_share/models/user.dart';
import 'package:flutter_share/pages/comments.dart';
import 'package:flutter_share/pages/profile.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:flutter_share/widgets/custom_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  final Map<String, dynamic> likes;

  const Post({
    Key key,
    @required this.postId,
    @required this.ownerId,
    @required this.username,
    @required this.location,
    @required this.description,
    @required this.mediaUrl,
    @required this.likes,
  }) : super(key: key);

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      location: doc['location'],
      description: doc['description'],
      mediaUrl: doc['mediaUrl'],
      likes: doc['likes'],
    );
  }

  int getLikeCount(Map<String, dynamic> likes) {
    if (likes == null) return 0;

    int count = 0;
    likes.values.forEach((isLiked) {
      if (isLiked) count += 1;
    });

    return count;
  }

  @override
  _PostState createState() => _PostState(
        postId: this.postId,
        ownerId: this.ownerId,
        username: this.username,
        description: this.description,
        location: this.location,
        mediaUrl: this.mediaUrl,
        likes: this.likes,
        likeCount: getLikeCount(this.likes),
      );
}

class _PostState extends State<Post> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  Map<String, dynamic> likes;
  int likeCount;
  bool _isLiked;
  bool _showHeart = false;

  _PostState({
    @required this.postId,
    @required this.ownerId,
    @required this.username,
    @required this.location,
    @required this.description,
    @required this.mediaUrl,
    @required this.likes,
    @required this.likeCount,
  });

  void handleLikePost() async {
    if (_isLiked) {
      setState(() {
        likeCount -= 1;
        _isLiked = false;
        likes[currentUserId] = false;
      });

      removeLikeFromActivityFeed();
    } else {
      setState(() {
        likeCount += 1;
        _isLiked = true;
        _showHeart = true;
        likes[currentUserId] = true;
      });

      Timer(Duration(milliseconds: 500), () {
        setState(() {
          _showHeart = false;
        });
      });

      addLikeToActivityFeed();
    }

    postsRef.doc(ownerId).collection('userPosts').doc(postId).update({
      'likes.$currentUserId': likes[currentUserId],
    });
  }

  void showDeleteDialog(BuildContext parentContext) async {
    await showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text('Remove this post?'),
            children: [
              SimpleDialogOption(
                onPressed: () async {
                  Navigator.pop(context);
                  await deletePost();
                },
                child: Text('Delete', style: TextStyle(color: Colors.red)),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ],
          );
        });


    setState(() {});
    Navigator.pop(context);
  }

  Future deletePost() async {
    // delete post
    postsRef.doc(ownerId).collection('userPosts').doc(postId).get().then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

    // delete uploaded image
    storageRef.child('post_$postId.jpg').delete();

    // delete activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .doc(ownerId)
        .collection('feedItems')
        .where('postId', isEqualTo: postId)
        .get();

    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

    // delete all comments
    QuerySnapshot commentsSnapshot =
        await commentsRef.doc(postId).collection('comments').get();

    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  void addLikeToActivityFeed() async {
    if (currentUserId == ownerId) return;

    await activityFeedRef.doc(ownerId).collection('feedItems').doc(postId).set({
      'type': 'like',
      'username': currentUser.username,
      'userId': currentUser.id,
      'userProfileImg': currentUser.photoUrl,
      'postId': postId,
      'mediaUrl': mediaUrl,
      'timestamp': DateTime.now(),
    });
  }

  void removeLikeFromActivityFeed() async {
    if (currentUserId == ownerId) return;

    await activityFeedRef
        .doc(ownerId)
        .collection('feedItems')
        .doc(postId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  void showComments() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Comments(
          postId: postId,
          postOwnerId: ownerId,
          postMediaUrl: mediaUrl,
        ),
      ),
    );
  }

  void showProfile(BuildContext context, {String profileId}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile(profileId: profileId)),
    );
  }

  Widget buildPostHeader() {
    return FutureBuilder(
      future: usersRef.doc(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return circularProgress(context);

        User user = User.fromDocument(snapshot.data);
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
          ),
          title: GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Text(
              user.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          subtitle: Text(location),
          trailing: currentUserId == ownerId
              ? IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => showDeleteDialog(context),
                )
              : SizedBox(),
        );
      },
    );
  }

  Widget buildPostImage() {
    return GestureDetector(
      onDoubleTap: handleLikePost,
      child: Stack(
        alignment: Alignment.center,
        children: [
          cachedNetworkImage(mediaUrl),
          _showHeart
              ? Animator(
                  duration: Duration(milliseconds: 300),
                  tween: Tween(begin: 0.8, end: 1.4),
                  curve: Curves.elasticOut,
                  cycles: 0,
                  builder: (context, animation, widget) => Transform.scale(
                    scale: animation.value,
                    child: Icon(Icons.favorite, size: 80, color: Colors.red),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget buildPostFooter() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: handleLikePost,
                child: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  size: 28,
                  color: Colors.pink,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: showComments,
                child: Icon(
                  Icons.chat,
                  size: 28,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "$likeCount likes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "$username ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Text(description),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    _isLiked = likes[currentUserId] == true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildPostHeader(),
        buildPostImage(),
        buildPostFooter(),
      ],
    );
  }
}
