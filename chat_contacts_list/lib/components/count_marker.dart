import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class CountMarker extends StatelessWidget {
  final String text;

  const CountMarker({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF719CF8),
          borderRadius: BorderRadius.circular(7)),
      child: Text(
        "$text",
        style: kChatElUnreadCountStyle,
      ),
    );
  }
}
