import 'package:flutter/material.dart';

import '../constants/input_page_constants.dart';

class CardChild extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  CardChild({this.cardIcon, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kCardChildTextStyle,
        )
      ],
    );
  }
}
