import 'package:flutter/material.dart';
import 'package:flutter_customer_widget/router/router.dart';
// import 'package:flutter_customer_widget/widget/double_tap_widget.dart';
// import 'package:flutter_customer_widget/widget/circle_progressbar_widget.dart';
// import 'package:flutter_customer_widget/widget/circle_view.dart';
// import 'package:flutter_customer_widget/widget/layout_widget.dart';
// import 'package:flutter_customer_widget/widget/move_widget.dart';
// import 'package:flutter_customer_widget/widget/painter_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      //home: PainterWidget(size: Size(600, 400), useAngle: false,),
    );
  }

}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      )
    );
  }
}