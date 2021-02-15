import 'package:flutter/material.dart';

class FeedRecentlyPlayedItem extends StatelessWidget {
  final String title;
  final String authorName;
  final int rating;
  final bool isFavourite;

  const FeedRecentlyPlayedItem({
    Key key,
    @required this.title,
    @required this.authorName,
    @required this.rating,
    @required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.play_circle_outline, color: Color(0xFFDC5897), size: 30),
          SizedBox(width: 24),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.white.withOpacity(0.07),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        authorName,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          color: Colors.white.withOpacity(0.28),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: Color(0xFFEE5A30),
                        size: 15,
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [1, 2, 3, 4, 5]
                            .map((index) => Icon(
                                  index <= rating ? Icons.star : Icons.star_border,
                                  color: Color(0xFFE1914B),
                                  size: 15,
                                ))
                            .toList(),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
