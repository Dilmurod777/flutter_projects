import 'package:flutter/material.dart';

class SongsAllItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String artistName;

  const SongsAllItem({
    Key key,
    @required this.imagePath,
    @required this.title,
    @required this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(width: 1, color: Colors.white.withOpacity(0.34)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Color(0xFF272B36),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Container(
              height: 46,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 14),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.white.withOpacity(0.07),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        artistName,
                        style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.white.withOpacity(0.28),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 30,
                      color: Color(0xFFE0638E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
