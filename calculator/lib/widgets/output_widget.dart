import 'package:flutter/material.dart';

import '../constants.dart';

class OutputWidget extends StatelessWidget {
  String previousOperation;
  String currentOperation;

  OutputWidget({this.previousOperation, this.currentOperation});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            previousOperation,
            textAlign: TextAlign.end,
            style: kOutputWidgetPreviousOperationTextStyle,
          ),
          Text(
            currentOperation,
            textAlign: TextAlign.end,
            style: kOutputWidgetCurrentOperationTextStyle,
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
