import 'package:flutter/material.dart';

import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';

import 'components/songs_artists_item/songs_artists_item.dart';

class SongsArtistsOptions extends StatelessWidget {
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
            SongsArtistsItem(title: 'play', onTap: () {}),
            SongsArtistsItem(title: 'play next', onTap: () {}),
            SongsArtistsItem(
                title: 'add to playing queue', onTap: () {}),
            SongsArtistsItem(title: 'add to playlist', onTap: () {}),
            SongsArtistsItem(title: 'rename', onTap: () {}),
            SongsArtistsItem(title: 'tag editor', onTap: () {}),
            SongsArtistsItem(title: 'go to artist', onTap: () {}),
            SongsArtistsItem(title: 'delete from device', onTap: () {}),
            SongsArtistsItem(title: 'share', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
