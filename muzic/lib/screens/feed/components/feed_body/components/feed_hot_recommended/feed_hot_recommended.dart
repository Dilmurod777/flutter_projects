import 'package:flutter/material.dart';

import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'components/feed_hot_recommended_item/feed_hot_recommended_item.dart';

class FeedHotRecommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'Hot Recommended',
            style: TextStyle(
              fontFamily: 'CircularStd',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        SizedBox(height: 19),
        ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                FeedHotRecommendedItem(
                  imagePath: 'assets/images/HotRecommended/1.png',
                  title: 'Sound of Sky',
                  artistName: 'Dilon Bruce',
                ),
                FeedHotRecommendedItem(
                  imagePath: 'assets/images/HotRecommended/2.png',
                  title: 'Girl on Fire',
                  artistName: 'Alecia Keys',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
