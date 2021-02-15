import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/pages/post_screen.dart';
import 'package:flutter_share/widgets/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({
    Key key,
    @required this.post,
  }) : super(key: key);

  void showPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostScreen(userId: post.ownerId, postId: post.postId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPost(context),
      child: CachedNetworkImage(
        imageUrl: post.mediaUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
