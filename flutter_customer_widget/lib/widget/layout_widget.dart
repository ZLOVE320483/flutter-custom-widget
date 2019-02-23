import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final GlobalKey<ScaleWidgetState> scaleKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('LayoutWidget --- build ---');
    return Container(
      width: 250,
      height: 150,
      child: Column(
        children: <Widget>[
          ScaleWidget(scaleKey),
          RaisedButton(onPressed: () => scaleKey.currentState.zoomOut(), child: Text('Press'),)
        ],
      ),
    );
  }
}

class ScaleWidget extends StatefulWidget {

  final Key scaleKey;

  ScaleWidget(this.scaleKey) : super(key: scaleKey);

  @override
  State<StatefulWidget> createState() => ScaleWidgetState();
}

class ScaleWidgetState extends State<ScaleWidget> {

  double _width;
  double _height;

  @override
  void initState() {
    super.initState();
    _width = 200;
    _height = 100;
  }

  void zoomOut() {
    setState(() {
      _width = _width * 1.1;
      _height = _height * 1.1;
      print('w -- $_width -- $_height');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ScaleWidget --- build ---');
    return Container(
      width: _width,
      height: _height,
      color: Colors.red,
    );
  }
}