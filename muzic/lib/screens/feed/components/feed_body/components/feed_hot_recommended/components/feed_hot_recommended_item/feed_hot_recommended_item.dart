import 'package:flutter/material.dart';

class FeedHotRecommendedItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String artistName;

  const FeedHotRecommendedItem({
    Key key,
    @required this.imagePath,
    @required this.title,
    @required this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 230,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            title,
            style: TextStyle(
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 5),
          Text(
            artistName,
            style: TextStyle(
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Color(0xFF585A66),
            ),
          ),
        ],
      ),
    );
  }
}
