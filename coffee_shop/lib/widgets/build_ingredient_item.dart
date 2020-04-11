import 'package:flutter/material.dart';

import '../utils/text_styles.dart';

class BuildIngredientItem extends StatelessWidget {
  final String name;
  final Icon icon;
  final Color bgColor;

  BuildIngredientItem({this.name, this.icon, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: bgColor,
            ),
            child: Center(
              child: icon,
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            width: 60.0,
            child: Center(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: kIngridientNameTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
