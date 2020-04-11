import 'package:flutter/material.dart';

import '../data.dart';
import './card_details.dart';

class CardSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text(
            'Card Selected',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, i) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: customShadow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      top: 100,
                      bottom: -200,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: -300,
                      top: -100,
                      bottom: -100,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                    CardDetails(),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
