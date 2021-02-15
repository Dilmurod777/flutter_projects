import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArtistHeaderInfo extends StatelessWidget {
  final int count;
  final String title;

  const ArtistHeaderInfo({
    Key key,
    @required this.count,
    @required this.title,
  }) : super(key: key);

  String getFormattedCount() {
    return NumberFormat.decimalPattern().format(count);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getFormattedCount(),
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 2),
        Text(
          title[0].toUpperCase() + title.substring(1),
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Color(0xFFEEEEEE).withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
