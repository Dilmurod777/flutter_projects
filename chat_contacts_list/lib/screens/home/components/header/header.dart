import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Header extends StatefulWidget {
  final double scrollDelta;

  const Header({Key key, this.scrollDelta}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  double totalTime = 10;
  double height = 38.0;
  double topPadding = kHeaderTopPadding;
  double bottomPadding = kHeaderBottomPadding;
  double iconSize = 26.0;
  double opacity = 1;
  int direction = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kHeaderLeftPadding,
        right: kHeaderRightPadding,
        top: topPadding = (topPadding + widget.scrollDelta).clamp(0.0, kHeaderTopPadding.toDouble()),
        bottom: bottomPadding = (bottomPadding + widget.scrollDelta).clamp(0.0, kHeaderBottomPadding.toDouble()),
      ),
      child: Opacity(
        opacity: opacity = (opacity + widget.scrollDelta / 20).clamp(0.0, 1.0),
        child: Container(
          height: height = (height + widget.scrollDelta).clamp(0.0, 38.0),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Сообщения',
                style: kHeadingStyle,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Icon(
                  Icons.clear,
                  size: iconSize = (iconSize + widget.scrollDelta).clamp(0.0, 26.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
