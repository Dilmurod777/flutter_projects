import 'package:flutter/material.dart';

class SongsPlaylistsItem extends StatelessWidget {
  final Map<String, dynamic> playlist;

  const SongsPlaylistsItem({
    Key key,
    @required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.55),
            BlendMode.hardLight,
          ),
          image: AssetImage(playlist['imagePath']),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 9, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playlist['title'],
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '${playlist['count']} Songs',
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Color(0xFFC1C0C0),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
