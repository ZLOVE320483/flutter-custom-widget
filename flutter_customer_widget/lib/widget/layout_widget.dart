import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final GlobalKey<ScaleWidgetState> scaleKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      color: Colors.white,
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      color: Colors.red,
    );
  }
}