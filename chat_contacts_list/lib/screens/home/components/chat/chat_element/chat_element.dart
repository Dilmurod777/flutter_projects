import 'package:chat_contacts_list/components/count_marker.dart';
import 'package:chat_contacts_list/components/online_marker.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatElement extends StatelessWidget {
  final User user;

  const ChatElement({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unreadCount = user.history.where((element) => !element.isRead).length;

    return Padding(
      padding: EdgeInsets.only(
        left: kChatElLeftPadding,
        right: kChatElRightPadding,
        top: kChatElTopPadding,
        bottom: kChatElBottomPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 72,
                  width: 72,
                  child: Image.network(user.imgUrl),
                ),
              ),
              user.isOnline ? OnlineMarker(isLarge: false) : Container(),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(user.firstName, style: kChatElUsernameStyle),
                    SizedBox(width: 7),
                    user.isPinned
                        ? Padding(
                            padding: EdgeInsets.only(top: 7),
                            child: Icon(
                              Icons.bookmark,
                              size: 22,
                              color: Color(0xFF719BF7),
                            ),
                          )
                        : Container()
                  ],
                ),
                Text(
                  "${user.history.last.text}",
                  style: TextStyle(
                    color:
                        unreadCount > 0 ? Color(0xFF131313) : Color(0xFFC4C4C4),
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "${DateFormat('HH:mm').format(user.history.last.time)}",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color:
                      unreadCount > 0 ? Color(0xFF131313) : Color(0xFFC4C4C4),
                ),
              ),
              SizedBox(height: 10),
              unreadCount > 0
                  ? CountMarker(text: unreadCount.toString())
                  : Icon(
                      Icons.done_all,
                      size: 20,
                      color: Color(0xFFC4C4C4),
                    )
            ],
          )
        ],
      ),
    );
  }
}
