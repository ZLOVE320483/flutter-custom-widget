import 'package:flutter/material.dart';
import 'package:flutter_customer_widget/widget/circle_painter.dart';
import 'dart:math' as math;

class DoubleTapWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => DoubleTapWidgetState();
}

class DoubleTapWidgetState extends State<DoubleTapWidget> {

  double dx;
  double dy;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    dx = 0.0;
    dy = 0.0;
    widgets.add(GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: (details) {
        setState(() {
          double random = math.Random().nextDouble() - 0.5;
          double angle = random * math.pi / 4;
          widgets.add(HeartWidget(angle, details.globalPosition.dx, details.globalPosition.dy));
        });
      },
      child: Container(
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: widgets,
      ),
    );
  }
}

class HeartWidget extends StatefulWidget {

  final double angle;
  final double dx;
  final double dy;

  HeartWidget(this.angle, this.dx, this.dy);

  @override
  State<StatefulWidget> createState() => HeartWidgetState();
}

class HeartWidgetState extends State<HeartWidget> with SingleTickerProviderStateMixin {

  Animation<double> _alphaAnimation;
  AnimationController _alphaController;
  double _opacity;

  Animation<double> _transformAnimation;
  Offset _offset;

  @override
  void initState() {
    super.initState();
    _opacity = 1.0;
    _offset = Offset(widget.dx - 100, widget.dy - 150);

    _alphaController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _alphaAnimation = Tween(begin: 1.0, end: 0.0).animate(_alphaController);

    _transformAnimation = Tween(begin: 0.0, end: -50.0).animate(_alphaController);

    _alphaController.addListener(() {
      setState(() {
        _opacity = _alphaAnimation.value;

        double _dx = widget.dx - 100;
        double _dy = widget.dy - 150 + _transformAnimation.value;
        _offset = Offset(_dx, _dy);
      });
    });

    _alphaController.forward();
  }

  @override
  void dispose() {
    _alphaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: Transform.translate(
          offset: _offset,
          child: Transform.rotate(
              angle: widget.angle,
              child: CustomPaint(
                painter: CirclePainter(widget.dx, widget.dy),
              )
          ),
        ),
    );
  }
}