import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';

class SongsArtistsItem extends StatelessWidget {
  final String imagePath;
  final String artistName;
  final int albumsCount;
  final int songsCount;

  const SongsArtistsItem({
    Key key,
    @required this.imagePath,
    @required this.artistName,
    @required this.albumsCount,
    @required this.songsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        eventBus.fire(HomeInnerPageChangeEvent(type: SongsInnerPageType.Artist));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.42),
                  width: 1,
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/Artists/1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artistName,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$albumsCount Albums',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Color(0xFFC1C0C0),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '$songsCount Songs',
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Color(0xFFC1C0C0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      eventBus.fire(ArtistsOptionsEvent(true));
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white.withOpacity(0.8),
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
