import 'package:flutter/material.dart';
import 'package:muzic/screens/now_playing/now_playing.dart';

import '../../common/data.dart';
import '../../common/events.dart';

import 'components/home_body/home_body.dart';
import 'components/home_bottom_bar/home_bottom_bar.dart';
import 'components/home_drawer/home_drawer.dart';
import 'components/home_active_song_controls/home_active_song_controls.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey();

  int _currentPage = 0;
  PageController _mainPageController;
  int _animationDuration = 250;

  PageController _songsPageController;
  SongsInnerPageType innerPageType = SongsInnerPageType.Album;
  bool _showActiveSongControls = true;

  PageController _nowPlayingPageController;

  void onPageChangeHandler(int index) {
    if (_nowPlayingPageController.page != 0) {
      setState(() {
        _showActiveSongControls = true;
      });

      _nowPlayingPageController.animateToPage(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }

    Future.delayed(
      Duration(milliseconds: _nowPlayingPageController.page == 0 ? 0 : 320),
      () {
        _mainPageController.animateToPage(
          index,
          duration: Duration(milliseconds: _animationDuration),
          curve: Curves.linear,
        );

        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  @override
  void initState() {
    _mainPageController = PageController(initialPage: _currentPage);
    _songsPageController = PageController(initialPage: currentFilter);
    _nowPlayingPageController = PageController(initialPage: 0);

    eventBus.on<ActiveSongControlsEvent>().listen((event) {
      setState(() {
        _showActiveSongControls = event.isShown;
      });
    });

    eventBus.on<DrawerEvent>().listen((event) {
      if (event.isOpened) {
        _homeScaffoldKey.currentState.openDrawer();
      }
    });

    eventBus.on<HomeInnerPageChangeEvent>().listen((event) {
      if (!event.goBack) {
        setState(() {
          innerPageType = event.type;
        });
      }

      if (_songsPageController.positions.isNotEmpty) {
        _songsPageController.animateToPage(
          event.goBack ? 0 : 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      }
    });

    eventBus.on<NowPlayingPageChangeEvent>().listen((event) {
      _nowPlayingPageController.animateToPage(
        event.isShown ? 1 : 0,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      drawer: HomeDrawer(),
      bottomNavigationBar: HomeBottomBar(
        currentPage: _currentPage,
        onPageChange: onPageChangeHandler,
      ),
      body: Stack(
        children: [
          HomeBody(
            mainPageController: _mainPageController,
            songsToAlbumPageController: _songsPageController,
            nowPlayingPageController: _nowPlayingPageController,
            innerPageType: innerPageType,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
                _showActiveSongControls ? HomeActiveSongControls() : SizedBox(),
          ),
        ],
      ),
    );
  }
}
