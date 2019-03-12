import 'package:flutter/material.dart';
import 'dart:async';
import './page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }

}

class SplashPage extends StatefulWidget {

@override
  State<StatefulWidget> createState() => SplashPageState();

}

class SplashPageState extends State<SplashPage> {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1500), () {
        try {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
            return HomePage();
          }), (route) {
            return route == null;
          });
        } catch (e) {
        }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      )
    );
  }
}

