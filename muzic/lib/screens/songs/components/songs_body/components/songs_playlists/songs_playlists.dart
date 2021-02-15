import 'package:flutter/material.dart';

import 'package:muzic/common/data.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/songs/components/songs_body/components/songs_playlists/components/songs_playlists_item/songs_playlists_item.dart';
import 'package:muzic/screens/songs/components/songs_body/components/songs_playlists/components/songs_playlists_mine/songs_playlists_mine.dart';

class SongsPlaylists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Column(
          children: [
            Wrap(
              children: playlists.map((playlist) {
                return SongsPlaylistsItem(playlist: playlist);
              }).toList(),
            ),
            SizedBox(height: 35),
            SongsPlaylistsMine(),
          ],
        ),
      ),
    );
  }
}
