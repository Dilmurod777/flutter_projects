import 'package:flutter/material.dart';

class ArtistTopAlbumsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: AssetImage('assets/images/Albums/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Fire Dragon',
            style: TextStyle(
              fontFamily: 'CircularStd',
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 6),
          Text(
            '2019',
            style: TextStyle(
              fontFamily: 'CircularStd',
              fontWeight: FontWeight.w300,
              fontSize: 10,
              color: Color(0xFFEEEEEE).withOpacity(0.38),
            ),
          ),
        ],
      ),
    );
  }
}
