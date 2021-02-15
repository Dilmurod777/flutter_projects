import 'package:flutter/material.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';
import 'package:muzic/screens/artist/components/artist_body/components/artist_top_albums/components/artist_top_albums_item/artist_top_albums_item.dart';

class ArtistTopAlbums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 36, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Top Albums',
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
          ),
          SizedBox(height: 25),
          ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: List.filled(10, 0)
                    .map((index) => ArtistTopAlbumsItem())
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
