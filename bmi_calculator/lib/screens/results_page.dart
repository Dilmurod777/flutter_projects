import 'package:flutter/material.dart';

import '../constants/results_page_constants.dart';
import '../components/calculate_button.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String weightText;
  final String weightNumberText;
  final String weightResultText;

  ResultsPage(
      {@required this.weightText,
      @required this.weightNumberText,
      @required this.weightResultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    weightText.toUpperCase(),
                    style: kWeightTextStyle,
                  ),
                  Text(
                    weightNumberText,
                    style: kWeightNumberStyle,
                  ),
                  Text(
                    weightResultText,
                    style: kWeightResultStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
