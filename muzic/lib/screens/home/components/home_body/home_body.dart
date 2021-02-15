import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/screens/album/album.dart';
import 'package:muzic/screens/artist/artist.dart';

import 'package:muzic/screens/feed/feed.dart';
import 'package:muzic/screens/now_playing/now_playing.dart';
import 'package:muzic/screens/songs/songs.dart';
import 'package:muzic/screens/settings/settings.dart';

class HomeBody extends StatelessWidget {
  final PageController mainPageController;
  final PageController songsToAlbumPageController;
  final PageController nowPlayingPageController;
  final SongsInnerPageType innerPageType;

  const HomeBody({
    Key key,
    @required this.mainPageController,
    @required this.songsToAlbumPageController,
    @required this.nowPlayingPageController,
    @required this.innerPageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var innerPage;
    switch (innerPageType) {
      case SongsInnerPageType.Album:
        innerPage = AlbumScreen();
        break;
      case SongsInnerPageType.Artist:
        innerPage = ArtistScreen();
        break;
    }

    return PageView(
      controller: nowPlayingPageController,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      children: [
        PageView(
          controller: mainPageController,
          allowImplicitScrolling: false,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          children: [
            FeedScreen(),
            PageView(
              controller: songsToAlbumPageController,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              children: [
                SongsScreen(),
                innerPage,
              ],
            ),
            SettingsScreen(),
          ],
        ),
        NowPlayingScreen(),
      ],
    );
  }
}
