import 'package:flutter/material.dart';

import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';

import 'components/songs_albums_item/songs_albums_item.dart';

class SongsAlbumsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
        decoration: BoxDecoration(
          color: Color(0xFF383B49),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SongsAlbumsItem(title: 'play', onTap: () {}),
            SongsAlbumsItem(title: 'play next', onTap: () {}),
            SongsAlbumsItem(title: 'add to playing queue', onTap: () {}),
            SongsAlbumsItem(title: 'add to playlist', onTap: () {}),
            SongsAlbumsItem(title: 'rename', onTap: () {}),
            SongsAlbumsItem(title: 'tag editor', onTap: () {}),
            SongsAlbumsItem(title: 'go to artist', onTap: () {}),
            SongsAlbumsItem(title: 'delete from device', onTap: () {}),
            SongsAlbumsItem(title: 'share', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
