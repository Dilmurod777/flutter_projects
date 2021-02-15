import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muzic/screens/songs/components/songs_albums_options/songs_albums_options.dart';
import 'package:muzic/screens/songs/components/songs_artists_options/songs_artists_options.dart';

import '../../common/data.dart';
import '../../common/events.dart';
import 'components/songs_body/songs_body.dart';

class SongsScreen extends StatefulWidget {
  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  int _currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    _currentPage = currentFilter;
    _pageController = PageController(initialPage: _currentPage);

    eventBus.on<FiltersEvent>().listen((event) {
      if (_pageController.positions.isNotEmpty) {
        _pageController?.animateToPage(
          event.index,
          duration: Duration(milliseconds: 250),
          curve: Curves.linear,
        );

        if (mounted) {
          setState(() {
            currentFilter = event.index;
            _currentPage = event.index;
          });
        }
      }
    });

    eventBus.on<AlbumsOptionsEvent>().listen((event) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return SongsAlbumsOptions();
          });
    });

    eventBus.on<ArtistsOptionsEvent>().listen((event) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return SongsArtistsOptions();
          });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: InkWell(
              onTap: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.35),
                size: 30,
              ),
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Songs',
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            eventBus.fire(DrawerEvent(true));
          },
          child: Icon(
            Icons.view_headline,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
      body: SongsBody(
        currentPage: _currentPage,
        controller: _pageController,
      ),
    );
  }
}
