import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

int currentFilter = 0;
List<String> filters = [
  'All Songs',
  'Playlists',
  'Albums',
  'Artists',
  'Genres'
];

enum SongsInnerPageType { Album, Artist }
enum HomeInnerPageType { Home, NowPlaying }

List<Map<String, dynamic>> playlists = [
  {
    'title': 'My Top Tracks',
    'count': 100,
    'imagePath': 'assets/images/Playlists/top.png'
  },
  {
    'title': 'Latest Added',
    'count': 323,
    'imagePath': 'assets/images/Playlists/latest.png'
  },
  {
    'title': 'History',
    'count': 450,
    'imagePath': 'assets/images/Playlists/history.png'
  },
  {
    'title': 'Favourites',
    'count': 966,
    'imagePath': 'assets/images/Playlists/favourites.png'
  },
];
