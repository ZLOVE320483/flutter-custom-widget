import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircleView extends SingleChildRenderObjectWidget {

  @override
  RenderObject createRenderObject(BuildContext context) {
    return new CircleViewRenderBox();
  }
}

class CircleViewRenderBox extends RenderConstrainedBox {

  CircleViewRenderBox() : super(additionalConstraints: const BoxConstraints.expand());

  @override
  bool hitTestSelf(Offset position) {
    print('position --- $position');
    return true;
  }

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    print('event --- ${event.position}');
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    print('offset --- $offset');

    Paint _paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    context.canvas.drawCircle(Offset(100, 100), 80, _paint);
  }

}