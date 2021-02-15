import 'package:flutter/material.dart';

import 'components//music_info/music_info.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.fromLTRB(56, 27, 57, 27),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Muzic',
            style: TextStyle(
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MusicInfo(number: 328, title: 'songs'),
              MusicInfo(number: 52, title: 'albums'),
              MusicInfo(number: 87, title: 'artists'),
            ],
          )
        ],
      ),
    );
  }
}
