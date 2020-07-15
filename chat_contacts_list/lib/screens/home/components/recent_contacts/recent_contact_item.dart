import 'package:chat_contacts_list/components/online_marker.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';

class RecentContactItem extends StatelessWidget {
  final User user;
  final double size;
  final double marginRight;
  final double sizedBoxHeight;
  final double textHeight;
  final double textOpacity;
  final double borderRadius;
  final double positionedBottom;
  final double positionedLeft;

  const RecentContactItem({
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
    final Widget onlineMarker =
        user.isOnline == true ? OnlineMarker(isLarge: true) : Container();

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
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              onlineMarker,
              Positioned(
                bottom: -11,
                left: 28,
                child: Opacity(
                  opacity: (size == 86) && (textHeight == 20) ? 1 : 0,
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
                ),
              ),
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
                  user.firstName,
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
