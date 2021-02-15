import 'package:flutter/material.dart';

class MusicInfo extends StatelessWidget {
  final int number;
  final String title;

  const MusicInfo({
    Key key,
    @required this.number,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$number',
          style: TextStyle(
            fontFamily: "CircularStd",
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Color(0xFFC1C0C0),
          ),
        ),
        SizedBox(height: 1),
        Text(
          title[0].toUpperCase() + title.substring(1),
          style: TextStyle(
            fontFamily: "CircularStd",
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Color(0xFFC1C0C0),
          ),
        ),
      ],
    );
  }
}
