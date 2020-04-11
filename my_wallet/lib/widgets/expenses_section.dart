import 'package:flutter/material.dart';

import '../data.dart';
import './pie_chart.dart';

class ExpensesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Expenses',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: expenses
                      .map(
                        (value) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    pieColors[expenses.indexOf(value)],
                              ),
                              SizedBox(width: 5),
                              Text(
                                value['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: PieChart(),
            ),
          ],
        ),
      ],
    );
  }
}
