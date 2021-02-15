import 'package:flutter/material.dart';
import 'package:muzic/screens/songs/components/songs_body/components/songs_genres/songs_genres.dart';

import 'components/songs_albums/songs_albums.dart';
import 'components/songs_all/songs_all.dart';
import 'components/songs_artists/songs_artists.dart';
import 'components/songs_playlists/songs_playlists.dart';
import 'components/songs_filters/songs_filters.dart';

class SongsBody extends StatelessWidget {
  final int currentPage;
  final PageController controller;

  const SongsBody({
    Key key,
    @required this.currentPage,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SongsFilters(currentPage: currentPage),
          Expanded(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              children: [
                SongsAll(),
                SongsPlaylists(),
                SongsAlbums(),
                SongsArtists(),
                SongsGenres(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
