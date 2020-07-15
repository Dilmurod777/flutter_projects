import 'dart:ui';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final User user;
  final double size;
  final double marginRight;
  final double sizedBoxHeight;
  final double textHeight;
  final double textOpacity;
  final double borderRadius;
  final double positionedBottom;
  final double positionedLeft;

  const MyProfile({
    Key key,
    this.user,
    this.size,
    this.marginRight,
    this.sizedBoxHeight,
    this.textHeight,
    this.textOpacity,
    this.borderRadius,
    this.positionedBottom,
    this.positionedLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(user.imgUrl)),
                    borderRadius: BorderRadius.circular(borderRadius)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: positionedBottom,
                left: positionedLeft,
                child: Container(
                  height: 23,
                  width: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF719CF7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite, size: 12, color: Colors.white),
                      Text("${user.likes}", style: kUserPopularityStyle)
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: sizedBoxHeight),
          Opacity(
            opacity: textOpacity,
            child: Container(
              height: textHeight,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Новых лайков',
                  style: kRecentContactsBottomTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
