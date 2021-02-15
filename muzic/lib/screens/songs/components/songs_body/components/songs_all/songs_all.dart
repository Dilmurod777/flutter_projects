import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/songs/components/songs_body/components/songs_all/components/songs_all_item/songs_all_item.dart';

class SongsAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.filled(20, 0).map((index) {
            return SongsAllItem(
              imagePath: 'assets/images/AllSongs/1.png',
              title: 'Billie Jean',
              artistName: 'Michael Jackson',
            );
          }).toList(),
        ),
      ),
    );
  }
}
