import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/feed/components/feed_body/components/feed_divider/feed_divider.dart';
import 'package:muzic/screens/feed/components/feed_body/components/feed_hot_recommended/feed_hot_recommended.dart';
import 'package:muzic/screens/feed/components/feed_body/components/feed_playlists/feed_playlists.dart';
import 'package:muzic/screens/feed/components/feed_body/components/feed_recently_played/feed_recently_played.dart';

class FeedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FeedHotRecommended(),
            FeedDivider(),
            FeedPlaylists(),
            FeedDivider(),
            FeedRecentlyPlayed(),
          ],
        ),
      ),
    );
  }
}
