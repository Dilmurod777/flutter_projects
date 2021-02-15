import 'package:flutter/material.dart';
import 'package:flutter_share/data/instances.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/post.dart';
import 'package:flutter_share/widgets/progress.dart';

class PostScreen extends StatelessWidget {
  final String userId;
  final String postId;

  const PostScreen({
    Key key,
    @required this.userId,
    @required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsRef.doc(userId).collection('userPosts').doc(postId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return circularProgress(context);

        Post post = Post.fromDocument(snapshot.data);

        return Center(
          child: Scaffold(
            appBar: header(context, titleText: post.description),
            body: ListView(
              children: [
                Container(
                  child: post,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
