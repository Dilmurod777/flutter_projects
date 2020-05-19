import 'package:flamingo/constraints.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  final double score;

  const BookRating({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFFD3D3D3).withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.star,
            color: kIconColor,
            size: 15,
          ),
          SizedBox(height: 5),
          Text(
            '$score',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
