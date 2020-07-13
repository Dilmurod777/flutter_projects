import 'package:chat_contacts_list/components/online_marker.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';

class RecentContactItem extends StatelessWidget {
  final User user;
  final bool showScrollEffect;
  final Animation animation;

  const RecentContactItem({
    Key key,
    this.user,
    this.showScrollEffect,
    this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget onlineMarker =
        user.isOnline == true ? OnlineMarker(isLarge: true) : Container();

    return Container(
      margin: EdgeInsets.only(right: 11 + 4 * animation.value),
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
                  image: DecorationImage(image: NetworkImage(user.imgUrl)),
                  borderRadius: showScrollEffect
                      ? BorderRadius.circular(25)
                      : BorderRadius.circular(33),
                ),
              ),
              onlineMarker,
              showScrollEffect
                  ? Container()
                  : Positioned(
                      bottom: -11,
                      left: 28,
                      child: Container(
                        height: 23,
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF719CF7),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text("${user.popularity}%",
                            style: kUserPopularityStyle),
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
                user.firstName,
                style: kRecentContactsBottomTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
