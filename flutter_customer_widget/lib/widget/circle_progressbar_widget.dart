import 'package:flutter/material.dart';
import 'package:flutter_customer_widget/widget/circle_progressbar_painter.dart';

class CircleProgressBarWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => CircleProgressBarWidgetState();
}

class CircleProgressBarWidgetState extends State<CircleProgressBarWidget> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;
  double progress = 0.0;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 6));
    _animation = Tween(begin: 0.0, end: 100.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {
        progress = _animation.value;
      });
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CicleProgressBar'),
      ),
      body: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.all(10.0),
        child: CustomPaint(
          painter: CircleProgressBarPainter(
              Colors.grey,
              Colors.red,
              10.0,
              progress
          ),
          child: Center(
            child: Text('${progress.toInt()} %'),
          ),
        ),
      ),
    );
  }
}