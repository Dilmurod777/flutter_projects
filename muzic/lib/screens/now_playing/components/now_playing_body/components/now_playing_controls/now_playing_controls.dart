import 'package:flutter/material.dart';
import 'package:muzic/screens/now_playing/components/now_playing_body/components/now_playing_controls/components/now_playing_controls_item/now_playing_controls_item.dart';

class NowPlayingControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 80,
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NowPlayingControlsItem(
                  icon: Icons.queue_music, title: 'playlist'),
              NowPlayingControlsItem(icon: Icons.shuffle, title: 'shuffle'),
              NowPlayingControlsItem(icon: Icons.repeat, title: 'repeat'),
              NowPlayingControlsItem(icon: Icons.equalizer, title: 'EQ'),
              NowPlayingControlsItem(
                icon: Icons.favorite_border,
                title: 'favourites',
                isLast: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
