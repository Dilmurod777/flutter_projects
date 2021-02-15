import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/artist/components/artist_body/components/artist_top_albums/artist_top_albums.dart';
import 'package:muzic/screens/artist/components/artist_body/components/artist_top_songs/artist_top_songs.dart';

import 'components/artist_body_header/artist_body_header.dart';

class ArtistBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ArtistBodyHeader(),
              ArtistTopAlbums(),
              ArtistTopSongs(),
            ],
          ),
        ),
      ),
    );
  }
}
