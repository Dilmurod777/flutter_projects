import 'dart:math' as math;
import 'package:flutter/material.dart';

class NowPlayingCustomBorder extends CustomPainter {
  final double circleRadius;
  final double angle;
  final Color fillColor;

  NowPlayingCustomBorder({
    this.angle = 240,
    this.circleRadius = 210 / 2,
    this.fillColor = const Color(0xFFD9519D),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(circleRadius, circleRadius),
      radius: circleRadius,
    );
    final startAngle = -math.pi / 2;
    final sweepAngle = angle * math.pi / 180;
    final useCenter = false;
    final linePaint = Paint()
      ..color = Color(0xFFE26A88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final offset = Offset(
      circleRadius + circleRadius * math.sin(sweepAngle),
      circleRadius - circleRadius * math.cos(sweepAngle),
    );
    final radius = 10.0;
    final circlePaint = Paint()
      ..color = Color(0xFFE26A88)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(offset, radius, circlePaint);
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
