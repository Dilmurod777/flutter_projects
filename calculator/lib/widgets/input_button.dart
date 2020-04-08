import 'package:flutter/material.dart';

import '../constants.dart';

class InputButton extends StatelessWidget {
  final String text;
  final int flex;
  final Color color;
  Function updateUI;

  InputButton({
    @required this.text,
    this.flex = 1,
    this.color = kInputButtonNonNumberColor,
    @required this.updateUI,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 100.0,
        child: FlatButton(
          onPressed: () {
            updateUI(text);
          },
          color: color,
          child: Text(
            text,
            style: kInputButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
