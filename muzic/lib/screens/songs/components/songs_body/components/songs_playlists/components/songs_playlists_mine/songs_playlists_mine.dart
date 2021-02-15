import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/songs/components/songs_body/components/songs_playlists/components/songs_playlists_mine/components/songs_playlists_mine_item/songs_playlists_mine_item.dart';

class SongsPlaylistsMine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Playlists',
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
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
        SizedBox(height: 25),
        ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.filled(10, 0)
                  .map((index) => SongsPlaylistsMineItem(
                        imagePath: 'assets/images/Playlists/queen.png',
                        title: 'Queens Collection',
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
