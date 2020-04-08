import 'package:flutter/material.dart';

import './constants.dart';
import './widgets/input_widget.dart';
import './widgets/output_widget.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String previousOperation = '';
  String currentOperation = '';
  String operator = '';

  void updateUI(String text) {
    switch (text) {
      case 'C':
        setState(() {
          previousOperation = currentOperation;
          currentOperation = '';
        });
        break;
      case '=':
        break;
      default:
        setState(() {
          if (currentOperation.length + 1 == 16) {
            return;
          }
          currentOperation += text;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          OutputWidget(
            previousOperation: previousOperation,
            currentOperation: currentOperation,
          ),
          InputWidget(updateUI: updateUI),
        ],
      ),
    );
  }
}
