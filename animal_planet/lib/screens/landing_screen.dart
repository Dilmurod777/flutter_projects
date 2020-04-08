import 'package:flutter/material.dart';

import './choose_plan_screen.dart';
import '../common/custom_appbar.dart';
import '../utils/strings.dart';
import '../utils/text_styles.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/elephant.jpg',
            height: height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: <Widget>[
              CustomAppBar(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, left: 32, right: 32),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: Strings.READY_TO_WATCH,
                        style: TextStyles.h1TextStyle,
                      ),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: Strings.READY_TO_WATCH_DESC,
                        style: TextStyles.readyToWatchDescTextStyle,
                      ),
                      TextSpan(text: "\n"),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: Strings.START_ENJOYING,
                        style: TextStyles.h2TextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChoosePlanScreen(),
                  ),
                );
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDAD4CC).withOpacity(0.8),
                ),
                child: Align(
                  alignment: Alignment(-0.4, -0.4),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
