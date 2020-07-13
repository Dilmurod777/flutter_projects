import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Animation animation;

  const Header({Key key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kHeaderLeftPadding,
        right: kHeaderRightPadding,
        top: kHeaderTopPadding * animation.value,
        bottom: kHeaderBottomPadding * animation.value,
      ),
      child: Opacity(
        opacity: animation.value,
        child: Container(
          height: 38 * animation.value,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Сообщения',
                style: kHeadingStyle,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Icon(Icons.clear, size: 26),
              )
            ],
          ),
        ),
      ),
    );
  }
}
