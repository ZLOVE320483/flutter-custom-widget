import 'package:flutter/material.dart';

class HomeBasePage extends StatelessWidget {

  final Widget child;
  final double bottom;

  HomeBasePage({this.child, this.bottom = 0});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: bottom,
      child: child,
    );
  }
}