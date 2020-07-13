import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kHPadding,
        right: kHPadding,
        top: kVPadding,
        bottom: kHeaderBottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Сообщения',
            style: kHeadingStyle,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: (){},
            child: Icon(Icons.clear, size: 26),
          )
        ],
      ),
    );
  }
}
