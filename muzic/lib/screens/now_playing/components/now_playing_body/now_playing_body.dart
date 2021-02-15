import 'package:flutter/material.dart';
import 'package:muzic/screens/now_playing/components/now_playing_body/components/now_playing_controls/now_playing_controls.dart';

import 'components/now_playing_custom_border/now_playing_custom_border.dart';

class NowPlayingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Stack(
              children: [
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Albums/1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomPaint(
                    painter: NowPlayingCustomBorder(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 280, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '3:15 | 4:26',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xFFC1C0C0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 320, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Black or White',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Michael Jackson',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Color(0xFFC1C0C0),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Album - Dangerous',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Color(0xFFC1C0C0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.multitrack_audio,
                  color: Color(0xFF7677DD),
                  size: 75,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: NowPlayingControls(),
          )
        ],
      ),
    );
  }
}
