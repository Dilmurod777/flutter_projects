import 'package:flutter/material.dart';

class SongsArtistsItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const SongsArtistsItem({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.07),
              width: 1,
            ),
          ),
        ),
        child: Text(
          title[0].toUpperCase() + title.substring(1),
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
