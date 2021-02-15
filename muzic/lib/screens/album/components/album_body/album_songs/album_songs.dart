import 'dart:math';

import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/album/components/album_body/album_songs/components/album_songs_item/album_songs_item.dart';

class AlbumSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 40, 5, 0),
      child: Column(
        children: List.filled(30, 0)
            .map(
              (index) => AlbumSongsItem(
                title: 'Billie Jean',
                duration: 300,
                isPlaying: Random().nextInt(2) == 0,
              ),
            )
            .toList(),
      ),
    );
  }
}
