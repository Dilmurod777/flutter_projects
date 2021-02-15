import 'package:flutter/material.dart';

class ArtistHeaderFollowBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 7, 25, 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            colors: [Color(0xFFD9519D), Color(0xFFDF618F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          'Follow',
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
