import 'package:flutter/material.dart';

class NowPlayingControlsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isLast;

  const NowPlayingControlsItem({
    Key key,
    @required this.icon,
    @required this.title,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, isLast ? 0 : 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Icon(
              icon,
              color: Color(0xFFE2E2E2),
              size: 35,
            ),
          ),
          SizedBox(height: 3),
          Text(
            title[0].toUpperCase() + title.substring(1),
            style: TextStyle(
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w300,
              fontSize: 10,
              color: Color(0xFFC1C0C0),
            ),
          )
        ],
      ),
    );
  }
}
