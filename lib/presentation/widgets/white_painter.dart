import 'dart:math';

import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';

class WhitePainter extends CustomPainter {
  final double radius;
  final AnimationController animationController;

  WhitePainter({this.animationController, this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final Rect _circle = Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: radius,
        height: radius);

    canvas.drawArc(
        _circle, -pi / 2, -1.25 * pi/ animationController.value, true, Paint()..color = kSwatch2);
  }

  @override
  bool shouldRepaint(WhitePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WhitePainter oldDelegate) => false;
}
