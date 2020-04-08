import 'package:flutter/material.dart';

import '../utils/text_styles.dart';
import '../utils/strings.dart';

class CustomAppBar extends StatelessWidget {
  final double opacity;

  CustomAppBar({this.opacity = 0.8});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Opacity(
        opacity: opacity, 
        child: Container(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Strings.APP_NAME,
                      style: TextStyles.appNameTextStyle,
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: Strings.TAG_LINE,
                      style: TextStyles.tagLineTextStyle,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
