import 'package:flutter/material.dart';

class ArtistTopSongsItem extends StatelessWidget {
  String getFormattedDuration() {
    return '344';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.play_circle_outline,
            color: Color(0xFFD9519D),
            size: 25,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.07),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          'Second of You',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "CircularStd",
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 50,
                        child: Text(
                          getFormattedDuration(),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "CircularStd",
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.28),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.white.withOpacity(0.6),
                      size: 30,
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
