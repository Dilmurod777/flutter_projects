import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muzic/screens/artist/components/artist_body/components/artist_body_header/components/artist_header_follow_btn/artist_header_follow_btn.dart';
import 'package:muzic/screens/artist/components/artist_body/components/artist_body_header/components/artist_header_info/artist_header_info.dart';
import 'components/artist_header_background/artist_header_background.dart';

class ArtistBodyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ArtistHeaderBackground(),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 45, 15, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dilon Bruce',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Pop rock, Funk pop, Heavy Metal',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.74),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ArtistHeaderInfo(count: 4367, title: 'followers'),
                    ArtistHeaderInfo(count: 128980, title: 'listeners'),
                    ArtistHeaderFollowBtn(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
