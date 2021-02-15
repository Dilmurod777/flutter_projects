import 'package:flutter/material.dart';
import 'package:muzic/screens/album/components/album_body/album_header/components/album_header_add_favourite_btn/album_header_add_favourite_btn.dart';
import 'package:muzic/screens/album/components/album_body/album_header/components/album_header_background/album_header_background.dart';
import 'package:muzic/screens/album/components/album_body/album_header/components/album_header_play_btn/album_header_play_btn.dart';
import 'package:muzic/screens/album/components/album_body/album_header/components/album_header_share_btn/album_header_share_btn.dart';

class AlbumHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Stack(
        children: [
          AlbumHeaderBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage('assets/images/Albums/1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'History',
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'by Michael Jackson',
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.74),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1996 . 18 songs . 64 min',
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.74),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AlbumHeaderPlayBtn(),
                  AlbumHeaderShareBtn(),
                  AlbumHeaderAddFavouriteBtn(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
