import 'package:flutter/material.dart';


import 'components/songs_albums_item/songs_albums_item.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';

class SongsAlbums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: 24,
            runSpacing: 20,
            children: List.filled(10, 0).map((index) {
              return SongsAlbumsItem(
                imagePath: 'assets/images/Albums/1.png',
                title: 'History',
                authorName: 'Michael Jackson',
                count: 10,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
