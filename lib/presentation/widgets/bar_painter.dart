import 'package:data_app/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final double value;
  final double end;
  final bool isSelected;

  Paint b1Paint = Paint()
    ..style = PaintingStyle.stroke
    ..color = kSwatch1
    ..strokeCap = StrokeCap.round;

  ChartPainter({this.isSelected, this.end, this.value});

  final Path path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    if (!isSelected) {
      b1Paint.strokeWidth = 10;

      path.moveTo(10, 110);
      path.lineTo(10, 110 - end * value);
    } else {
      b1Paint.strokeWidth = 15;
      path.moveTo(25, 110);
      path.lineTo(25, 110 - end * value);
    }
    canvas.drawPath(path, b1Paint);
    canvas.drawShadow(path.shift(const Offset(5, -10)), Colors.black, 20.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
