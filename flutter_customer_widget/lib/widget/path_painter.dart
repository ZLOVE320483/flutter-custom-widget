import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {

  Paint _paint = Paint()
    ..color = Colors.red // 画笔颜色
    ..strokeCap = StrokeCap.round  // 画笔笔触类型
    ..isAntiAlias = true // 是否抗锯齿
    ..style = PaintingStyle.fill
    ..strokeWidth = 5.0; // 画笔宽度

  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();

    var width = 100;
    var height = 150;
    path.moveTo(width / 2, height / 4);
    path.cubicTo((width * 6) / 7, height / 9, (width * 12) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path, _paint);

    Path path2 = new Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 13, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}