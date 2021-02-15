import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/album/components/album_body/album_header/album_header.dart';
import 'package:muzic/screens/album/components/album_body/album_songs/album_songs.dart';

class AlbumBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AlbumHeader(),
              AlbumSongs(),
            ],
          ),
        ),
      ),
    );
  }
}
