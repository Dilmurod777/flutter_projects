import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/feed/components/feed_body/components/feed_playlists/components/feed_playlists_item/feed_playlists_item.dart';

class FeedPlaylists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Playlist',
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Color(0xFFED8770),
                ),
              )
            ],
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
                FeedPlaylistsItem(
                  imagePath: 'assets/images/Playlists/1.png',
                  title: 'Classic Playlist',
                  artistName: 'Piano Guys',
                ),
                FeedPlaylistsItem(
                  imagePath: 'assets/images/Playlists/2.png',
                  title: 'Summer Playlist',
                  artistName: 'Dilon Bruce',
                ),
                FeedPlaylistsItem(
                  imagePath: 'assets/images/Playlists/3.png',
                  title: 'Pop Music',
                  artistName: 'Michael Jackson',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
