import 'dart:ui';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final User user;
  final bool showScrollEffect;
  final Animation animation;

  const MyProfile({
    Key key,
    this.user,
    this.showScrollEffect,
    this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12 + 4 * animation.value),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 66 + 20 * animation.value,
                width: 66 + 20 * animation.value,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(user.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: showScrollEffect
                      ? BorderRadius.circular(25)
                      : BorderRadius.circular(33),
                ),
                child: ClipRRect(
                  borderRadius: showScrollEffect
                      ? BorderRadius.circular(25)
                      : BorderRadius.circular(33),
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
                bottom: -11 + 32.5 * (1 - animation.value),
                left: 11 + 10 * animation.value,
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
          SizedBox(height: 15.0 * animation.value),
          Container(
            height: 20 * animation.value,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Новых лайков',
                style: kRecentContactsBottomTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
