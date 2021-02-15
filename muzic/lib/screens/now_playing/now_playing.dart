import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';
import 'package:muzic/screens/now_playing/components/now_playing_body/now_playing_body.dart';

class NowPlayingScreen extends StatefulWidget {
  @override
  _NowPlayingScreenState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            eventBus.fire(ActiveSongControlsEvent(true));
            eventBus.fire(NowPlayingPageChangeEvent(false));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: NowPlayingBody(),
    );
  }
}
