import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/songs/components/songs_body/components/songs_artists/components/songs_artists_item/songs_artists_item.dart';

class SongsArtists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.filled(10, 0).map((index) {
            return SongsArtistsItem(
              imagePath: 'assets/images/Artists/1.png',
              artistName: 'Beyonce',
              albumsCount: 4,
              songsCount: 38,
            );
          }).toList(),
        ),
      ),
    );
  }
}
