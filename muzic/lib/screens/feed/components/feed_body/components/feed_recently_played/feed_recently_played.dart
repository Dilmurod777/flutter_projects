import 'package:flutter/material.dart';
import 'components/feed_recently_played_item/feed_recently_played_item.dart';

class FeedRecentlyPlayed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recently Played',
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Color(0xFFED8770),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 19),
          Column(
            children: [
              FeedRecentlyPlayedItem(
                title: 'Billie Jean',
                authorName: 'Michael Jackson',
                rating: 4,
                isFavourite: false,
              ),
              FeedRecentlyPlayedItem(
                title: 'Earth Song',
                authorName: 'Michael Jackson',
                rating: 4,
                isFavourite: false,
              ),
              FeedRecentlyPlayedItem(
                title: 'Mirror',
                authorName: 'Justin Timberlake',
                rating: 5,
                isFavourite: true,
              ),
              FeedRecentlyPlayedItem(
                title: 'Remember the Time',
                authorName: 'Michael Jackson',
                rating: 4,
                isFavourite: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
