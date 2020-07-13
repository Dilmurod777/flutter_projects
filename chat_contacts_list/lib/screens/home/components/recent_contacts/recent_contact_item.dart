import 'package:chat_contacts_list/components/online_marker.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';

class RecentContactItem extends StatelessWidget {
  final User user;

  const RecentContactItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget onlineMarker = user.isOnline == true
        ? OnlineMarker()
        : Container();

    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(user.imgUrl)),
                  borderRadius: BorderRadius.circular(33),
                ),
              ),
              onlineMarker,
              Positioned(
                bottom: -11.5,
                left: 28,
                child: Container(
                  height: 23,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF719CF7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child:
                      Text("${user.popularity}%", style: kUserPopularityStyle),
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Text(user.firstName)
        ],
      ),
    );
  }
}
