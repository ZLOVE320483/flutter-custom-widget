import 'package:flutter/material.dart';
import 'package:flutter_customer_widget/widget/line_painter.dart';

class MoveWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoveWidgetState();
}

class MoveWidgetState extends State<MoveWidget>
    with SingleTickerProviderStateMixin {
  Offset _offset;
  double strokeWidth = 5.0;

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    _offset = Offset(0.0, 0.0);
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 5.0, end: 20.0).animate(animationController);
    animationController.addListener(() {
      setState(() {
        strokeWidth = animation.value;
      });
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offset,
      child: CustomPaint(
        painter: LinePainter(strokeWidth),
        child: Listener(
          behavior: HitTestBehavior.translucent,
          onPointerMove: (details) {
            setState(() {
              _offset = Offset(details.position.dx, details.position.dy);
              _offset -= Offset(50, 50);
            });
          },
        ),
      ),
    );
  }
}
