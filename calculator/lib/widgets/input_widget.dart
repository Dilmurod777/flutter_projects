import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import './input_button.dart';

class InputWidget extends StatelessWidget {
  Function updateUI;

  InputWidget({this.updateUI});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: kInputWidgetBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  InputButton(
                    text: 'C',
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '+/-',
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '%',
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '/',
                    updateUI: updateUI,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  InputButton(
                    text: '7',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '8',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '9',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: 'x',
                    updateUI: updateUI,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  InputButton(
                    text: '4',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '5',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '6',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '-',
                    updateUI: updateUI,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  InputButton(
                    text: '3',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '2',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '1',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '+',
                    updateUI: updateUI,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  InputButton(
                    text: '0',
                    flex: 2,
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: ',',
                    color: kInputButtonNumberColor,
                    updateUI: updateUI,
                  ),
                  InputButton(
                    text: '=',
                    color: kInputButtonEqualColor,
                    updateUI: updateUI,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
