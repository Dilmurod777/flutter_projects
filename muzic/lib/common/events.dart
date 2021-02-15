import 'package:muzic/common/data.dart';

class ActiveSongControlsEvent {
  bool isShown;

  ActiveSongControlsEvent(this.isShown);
}

class DrawerEvent {
  bool isOpened;

  DrawerEvent(this.isOpened);
}

class FiltersEvent {
  int index;

  FiltersEvent(this.index);
}

class AlbumsOptionsEvent {
  bool isShown;

  AlbumsOptionsEvent(this.isShown);
}

class ArtistsOptionsEvent {
  bool isShown;

  ArtistsOptionsEvent(this.isShown);
}

class HomeInnerPageChangeEvent {
  bool goBack;
  SongsInnerPageType type;

  HomeInnerPageChangeEvent({
    this.type = SongsInnerPageType.Album,
    this.goBack = false,
  });
}

class NowPlayingPageChangeEvent {
  bool isShown;

  NowPlayingPageChangeEvent(this.isShown);
}
