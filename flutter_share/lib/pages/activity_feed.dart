import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/data/instances.dart';
import 'package:flutter_share/pages/post_screen.dart';
import 'package:flutter_share/pages/profile.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:timeago/timeago.dart' as timeago;

class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
  Future getActivityFeed() async {
    QuerySnapshot snapshot = await activityFeedRef.doc(currentUser.id).collection('feedItems').orderBy('timestamp', descending: true).limit(50).get();

    List<ActivityFeedItem> feedItems = [];
    snapshot.docs.forEach((QueryDocumentSnapshot doc) {
      feedItems.add(ActivityFeedItem.fromDocument(doc));
    });

    return feedItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: header(context, titleText: "Activity Feed"),
      body: Container(
        child: FutureBuilder(
          future: getActivityFeed(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return circularProgress(context);

            return ListView(
              children: snapshot.data,
            );
          },
        ),
      ),
    );
  }
}

Widget mediaPreview;
String activityItemText;

class ActivityFeedItem extends StatelessWidget {
  final String username;
  final String userId;
  final String userProfileImg;
  final String type;
  final String commentData;
  final String mediaUrl;
  final String postId;
  final Timestamp timestamp;

  const ActivityFeedItem({
    Key key,
    @required this.username,
    @required this.userId,
    @required this.userProfileImg,
    @required this.type,
    @required this.commentData,
    @required this.mediaUrl,
    @required this.postId,
    @required this.timestamp,
  }) : super(key: key);

  factory ActivityFeedItem.fromDocument(QueryDocumentSnapshot doc) {
    return ActivityFeedItem(
      username: doc.data().containsKey('username') ? doc['username'] : '',
      userId: doc.data().containsKey('userId') ? doc['userId'] : '',
      userProfileImg: doc.data().containsKey('userProfileImg') ? doc['userProfileImg'] : '',
      type: doc.data().containsKey('type') ? doc['type'] : '',
      commentData: doc.data().containsKey('commentData') ? doc['commentData'] : '',
      mediaUrl: doc.data().containsKey('mediaUrl') ? doc['mediaUrl'] : '',
      postId: doc.data().containsKey('postId') ? doc['postId'] : '',
      timestamp: doc.data().containsKey('timestamp') ? doc['timestamp'] : '',
    );
  }

  void showPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostScreen(userId: userId, postId: postId)),
    );
  }

  void showProfile(BuildContext context, {String profileId}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile(profileId: profileId)),
    );
  }

  void configureMediaPreview(BuildContext context) {
    // print('configureMediaPreview');
    if (type == "like" || type == "comment") {
      mediaPreview = GestureDetector(
        onTap: () => showPost(context),
        child: Container(
          height: 50,
          width: 50,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(mediaUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      mediaPreview = SizedBox();
    }

    if (type == 'like') {
      activityItemText = "liked your post";
    } else if (type == "follow") {
      activityItemText = 'is following you';
    } else if (type == "comment") {
      activityItemText = 'replied: $commentData';
    } else {
      activityItemText = 'Error: Unknown type $type';
    }
  }

  @override
  Widget build(BuildContext context) {
    configureMediaPreview(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Container(
        color: Colors.white54,
        child: ListTile(
          title: GestureDetector(
            onTap: () => showProfile(context, profileId: userId),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' $activityItemText',
                  )
                ],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(userProfileImg),
          ),
          subtitle: Text(
            timeago.format(timestamp.toDate()),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: mediaPreview,
        ),
      ),
    );
  }
}
