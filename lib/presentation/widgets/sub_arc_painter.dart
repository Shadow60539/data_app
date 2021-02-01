import 'dart:math';

import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';

class SubArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect _circle = Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width,
        height: size.height);

    canvas.drawArc(
        _circle, -pi / 2, -1.25 * pi, true, Paint()..color = kSwatch2);
  }

  @override
  bool shouldRepaint(SubArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SubArcPainter oldDelegate) => false;
}
