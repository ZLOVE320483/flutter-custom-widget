import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleProgressBarPainter extends CustomPainter {

  final Color backgroundColor;
  final Color foregroundColor;
  final double strokeWidth;
  final double progress;

  Paint _paintBackGround;
  Paint _paintForeGround;

  CircleProgressBarPainter(this.backgroundColor, this.foregroundColor, this.strokeWidth, this.progress) {
    _paintBackGround = Paint()
      ..color = backgroundColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    _paintForeGround = new Paint()
      ..color = foregroundColor
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width > size.height ? size.width / 2 : size.height / 2;
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);
    canvas.drawCircle(Offset(radius, radius), radius, _paintBackGround);
    canvas.drawArc(rect, 0, (progress / 100) * 2 * math.pi, false, _paintForeGround);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}