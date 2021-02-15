import 'package:flutter/material.dart';

class AlbumSongsItem extends StatelessWidget {
  final String title;
  final int duration;
  final bool isPlaying;

  const AlbumSongsItem({
    Key key,
    @required this.title,
    @required this.duration,
    this.isPlaying = false,
  }) : super(key: key);

  String getFormattedDuration() {
    return '$duration';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: Icon(
              Icons.play_circle_outline,
              size: 30,
              color: Color(0xFFD9519D),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 25,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 130,
                        child: Text(
                          title,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
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
                            fontFamily: 'CircularStd',
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  isPlaying
                      ? Icon(
                          Icons.multitrack_audio,
                          color: Color(0xFF7677DD),
                          size: 20,
                        )
                      : InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.more_horiz_outlined,
                            color: Color(0xFF585A66),
                            size: 20,
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
