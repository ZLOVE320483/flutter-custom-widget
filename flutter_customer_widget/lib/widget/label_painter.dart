import 'package:flutter/material.dart';

class LabelPainter extends CustomPainter {

  var labelColor;
  var labelAlignment;
  var useAngle;
  var _paint;

  LabelPainter(this.labelColor, this.labelAlignment, this.useAngle) {
    _paint = new Paint()
      ..color = labelColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var drawSize = size.height > size.width ? size.width / 2 : size.height / 2;
    Path path = new Path();

    switch (labelAlignment) {
      case LabelAlignment.leftTop:
        if (!useAngle) {
          path.moveTo(drawSize/2, 0);
          path.lineTo(0, drawSize/2);
        }
        path.lineTo(0, drawSize);
        path.lineTo(drawSize, 0);

        break;
      case LabelAlignment.leftBottom:
        path.moveTo(0, size.height - drawSize);
        if(useAngle){
          path.lineTo(drawSize, size.height);
          path.lineTo(0, size.height);
        }else{
          path.lineTo(0, size.height-drawSize/2);
          path.lineTo(drawSize/2, size.height);
          path.lineTo(drawSize, size.height);
        }
        break;
      case LabelAlignment.rightTop:

        path.moveTo(size.width - drawSize, 0);
        if (useAngle) {
          path.lineTo(size.width, 0);

        }else{
          path.lineTo(size.width - drawSize / 2, 0);
          path.lineTo(size.width, drawSize / 2);
        }
        path.lineTo(size.width, drawSize);
        break;
      case LabelAlignment.rightBottom:
        if(useAngle){
          path.moveTo(size.width, size.height);

          path.lineTo(size.width - drawSize, size.height);
          path.lineTo(size.width, size.height - drawSize);
        }else{
          path.moveTo(size.width-drawSize, size.height);
          path.lineTo(size.width - drawSize/2, size.height);
          path.lineTo(size.width, size.height - drawSize/2);
          path.lineTo(size.width, size.height - drawSize);
        }
        break;
      default:
        if (!useAngle) {

          path.moveTo(drawSize/2, 0);
          path.lineTo(0, drawSize/2);
        }
        path.lineTo(0, drawSize);
        path.lineTo(drawSize, 0);
        break;
    }

    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class LabelAlignment {

  int labelAlignment;

  LabelAlignment(this.labelAlignment);

  static const leftTop = 0;
  static const leftBottom = 1;
  static const rightTop = 2;
  static const rightBottom = 3;
}