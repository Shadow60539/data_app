import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GearPainter extends CustomPainter {
  final double tickLength = 20.0;
  final double tickWidth = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..color = const Color(0xffF5D4D6);
    double tickMarkLength;
    final double angle = pi / 15;
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);
    for (var i = 0; i < 60; i++) {
      tickMarkLength = tickLength;
      tickPaint.strokeWidth = tickWidth;
      canvas.drawPoints(
          PointMode.polygon,
          [Offset(0.0, -radius), Offset(0, -radius + tickMarkLength)],
          tickPaint);

      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
