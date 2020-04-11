import 'package:flutter/material.dart';
import 'dart:math';

import '../data.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    expenses.forEach((element) {
      total += element['amount'];
    });

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: customShadow,
          color: primaryColor,
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomPaint(
                child: Container(),
                foregroundPainter: PieChartPainter(),
              ),
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: customShadow,
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    '\$${total.toInt()}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;
    double total = 0;
    expenses.forEach((element) {
      total += element['amount'];
    });

    var startRadiant = -pi / 2;
    for (int i = 0; i < expenses.length; i++) {
      var currentExpense = expenses[i];
      var sweepRadian = (currentExpense['amount'] / total) * 2 * pi;
      paint.color = pieColors[i];

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadiant,
        sweepRadian,
        false,
        paint,
      );
      startRadiant += sweepRadian;
    }
  }
}
