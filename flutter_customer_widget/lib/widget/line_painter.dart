import 'dart:ui';

import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {

  double strokeWidth;

  Paint _paint;

  LinePainter(this.strokeWidth) {
    _paint = Paint()
    ..color = Colors.blueAccent // 画笔颜色
    ..strokeCap = StrokeCap.round  // 画笔笔触类型
    ..isAntiAlias = true // 是否抗锯齿
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth; // 画笔宽度
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(50, 50), 50, _paint);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}