import 'dart:math';

import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';

class BigArcPainter extends CustomPainter {
  final double value;

  BigArcPainter(this.value);
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient outerGradient = SweepGradient(
      center: Alignment.topCenter,
      colors: <Color>[
        Color(0xffDD767B),
        Color(0xffE8969B),
      ],
      stops: [
        0.3,
        0.4,
      ],
    );
    const Gradient innerGradient = SweepGradient(
      colors: <Color>[kSwatch5, Colors.white],
      stops: [
        0.3,
        0.4,
      ],
    );

    final Rect _outerCircle = Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width + 2,
        height: size.height + 2);
    final Rect _innerCircle = Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width,
        height: size.height);

    canvas.drawArc(
        _outerCircle,
        -pi / 2,
        -1.25 * pi / value,
        true,
        Paint()
          ..color = kSwatch4
          ..shader = innerGradient.createShader(_outerCircle));
    canvas.drawArc(
        _innerCircle,
        -pi / 2,
        -1.25 * pi / value,
        true,
        Paint()
          ..color = kSwatch3
          ..shader = outerGradient.createShader(_innerCircle));
  }

  @override
  bool shouldRepaint(BigArcPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BigArcPainter oldDelegate) => false;
}
