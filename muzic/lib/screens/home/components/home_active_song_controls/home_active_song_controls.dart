import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';

class HomeActiveSongControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        eventBus.fire(ActiveSongControlsEvent(false));
        eventBus.fire(NowPlayingPageChangeEvent(true));
      },
      child: Container(
        height: 60,
        color: Color(0xFF0F1222),
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFD9519D), Color(0xFFD9519D)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -2,
              left: MediaQuery.of(context).size.width * 0.6,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFD9519D), Color(0xFFE36D86)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 7,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  eventBus.fire(ActiveSongControlsEvent(false));
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white.withOpacity(0.8),
                  size: 18,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/AllSongs/1.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Billie Jean',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Michael Jackson',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                  child: Row(
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
