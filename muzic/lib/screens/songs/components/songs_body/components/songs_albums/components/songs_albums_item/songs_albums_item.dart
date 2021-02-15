import 'dart:math';

import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';

class SongsAlbumsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String authorName;
  final int count;

  const SongsAlbumsItem({
    Key key,
    @required this.imagePath,
    @required this.title,
    @required this.authorName,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size =
        max((MediaQuery.of(context).size.width - 2 * 20 - 24) / 2, 150);

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        eventBus.fire(HomeInnerPageChangeEvent(type: SongsInnerPageType.Album));
      },
      child: Container(
        width: size,
        child: Column(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    eventBus.fire(AlbumsOptionsEvent(true));
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  authorName,
                  style: TextStyle(
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                    color: Color(0xFFC1C0C0),
                  ),
                ),
                Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                Text(
                  '$count Songs',
                  style: TextStyle(
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                    color: Color(0xFFC1C0C0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
