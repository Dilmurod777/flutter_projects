import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/data/instances.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  const Comments({
    Key key,
    @required this.postId,
    @required this.postOwnerId,
    @required this.postMediaUrl,
  }) : super(key: key);

  @override
  CommentsState createState() => CommentsState();
}

class CommentsState extends State<Comments> {
  TextEditingController _commentController = TextEditingController();

  void addComment() async {
    commentsRef.doc(widget.postId).collection('comments').add({
      'username': currentUser.username,
      'comment': _commentController.text.trim(),
      'timestamp': DateTime.now(),
      'avatarUrl': currentUser.photoUrl,
      'userId': currentUser.id,
    });

    if (currentUser.id != widget.postOwnerId) {
      activityFeedRef.doc(widget.postOwnerId).collection('feedItems').add({
        'type': 'comment',
        'commentData': _commentController.text.trim(),
        'username': currentUser.username,
        'userId': currentUser.id,
        'userProfileImg': currentUser.photoUrl,
        'postId': widget.postId,
        'mediaUrl': widget.postMediaUrl,
        'timestamp': DateTime.now(),
      });
    }

    _commentController.clear();
  }

  Widget buildComments() {
    return StreamBuilder(
      stream: commentsRef.doc(widget.postId).collection('comments').orderBy('timestamp', descending: false).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return circularProgress(context);

        List<Comment> comments = [];
        snapshot.data.documents.forEach((doc) {
          comments.add(Comment.fromDocument(doc));
        });

        return ListView(
          children: comments,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Comments"),
      body: Column(
        children: [
          Expanded(
            child: buildComments(),
          ),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: "Write a comment...",
              ),
            ),
            trailing: OutlineButton(
              onPressed: addComment,
              borderSide: BorderSide.none,
              child: Text('Post'),
            ),
          )
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  const Comment({
    Key key,
    @required this.username,
    @required this.userId,
    @required this.avatarUrl,
    @required this.comment,
    @required this.timestamp,
  }) : super(key: key);

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
      username: doc['username'],
      userId: doc['userId'],
      avatarUrl: doc['avatarUrl'],
      comment: doc['comment'],
      timestamp: doc['timestamp'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(comment),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          subtitle: Text(timeago.format(timestamp.toDate())),
        ),
        Divider(),
      ],
    );
  }
}
