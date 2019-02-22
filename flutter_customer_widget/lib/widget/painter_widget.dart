import 'package:flutter/material.dart';
import 'package:flutter_customer_widget/widget/label_painter.dart';
import 'dart:math' as math;
// import 'package:flutter_customer_widget/widget/line_painter.dart';
// import 'package:flutter_customer_widget/widget/path_painter.dart';

class PainterWidget extends StatefulWidget {

  final Size size;
  final Color labelColor;
  final int labelAlignment;
  final bool useAngle;
  final String labelText;
  final TextStyle textStyle;

  PainterWidget(
      {this.size = Size.infinite,
        this.labelText = "HOT",
        this.textStyle,
        this.labelColor = Colors.blue,
        this.labelAlignment = LabelAlignment.leftTop,
        this.useAngle = true});

  @override
  State<StatefulWidget> createState() => PainterWidgetState();
}

class PainterWidgetState extends State<PainterWidget> {

  var textAngle;
  var textAlignment;

  var offset;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Paint"),),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    var offsetX = widget.size.width > widget.size.height
        ? widget.size.height / 4.5
        : widget.size.width / 4.5;
    switch (widget.labelAlignment) {
      case LabelAlignment.leftTop:
        offset = Offset(offsetX, 0);
        textAlignment = Alignment.topLeft;
        textAngle = -math.pi / 4;
        break;
      case LabelAlignment.rightTop:
        offset = Offset(-offsetX, 0);
        textAlignment = Alignment.topRight;
        textAngle = math.pi / 4;
        break;
      case LabelAlignment.leftBottom:
        offset = Offset(offsetX, 0);
        textAlignment = Alignment.bottomLeft;
        textAngle = math.pi / 4;
        break;
      case LabelAlignment.rightBottom:
        offset = Offset(-offsetX, 0);
        textAlignment = Alignment.bottomRight;
        textAngle = -math.pi / 4;
        break;
    }
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      color: Colors.grey,
      child:  CustomPaint(
        size: widget.size,
        painter: LabelPainter(widget.labelColor, widget.labelAlignment, widget.useAngle),
        child: Align(
            alignment: textAlignment,
            child: Transform.rotate(
              angle: textAngle,
              child: Text(
                widget.labelText,
                style: widget.textStyle == null
                    ? TextStyle(color: Colors.white, fontSize: 16)
                    : widget.textStyle,
              ),
              origin: offset,
            )),
      ),
    );
  }

}