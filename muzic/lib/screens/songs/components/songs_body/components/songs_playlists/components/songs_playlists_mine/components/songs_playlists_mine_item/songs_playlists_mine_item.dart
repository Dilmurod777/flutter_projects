import 'package:flutter/material.dart';

class SongsPlaylistsMineItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const SongsPlaylistsMineItem({
    Key key,
    @required this.imagePath,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 90,
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              title,
              overflow: TextOverflow.fade,
              softWrap: false,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
