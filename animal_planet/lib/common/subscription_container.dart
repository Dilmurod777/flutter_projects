import 'package:animal_planet/utils/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubscriptionContainer extends StatelessWidget {
  final String amount, text, imagePath;

  SubscriptionContainer({this.amount, this.text, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.6;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  imagePath,
                  height: height / 4,
                  width: width - 32,
                  fit: BoxFit.fitWidth,
                ),
              )),
          Positioned(
            bottom: 0,
            left: 48,
            right: 48,
            top: 0,
            child: Row(
              children: <Widget>[
                Text(
                  text,
                  style: TextStyles.subscriptionTextTextStyle,
                ),
                Spacer(),
                Text(
                  "\$ $amount",
                  style: TextStyles.subscriptionAmountTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
