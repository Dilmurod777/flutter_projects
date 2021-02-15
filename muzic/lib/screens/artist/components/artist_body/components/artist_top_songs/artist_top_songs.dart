import 'package:flutter/material.dart';

import 'components/artist_top_songs_item/artist_top_songs_item.dart';

class ArtistTopSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Top Songs',
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Color(0xFFED8770),
                ),
              )
            ],
          ),
          SizedBox(height: 28),
          Column(
            children: List.filled(10, 0)
                .map((index) => ArtistTopSongsItem())
                .toList(),
          )
        ],
      ),
    );
  }
}
