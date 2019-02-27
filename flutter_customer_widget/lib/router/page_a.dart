import 'package:flutter/material.dart';
import 'package:annotation_route/route.dart';

@ARoute(url: 'page://pageA')
class PageA extends StatelessWidget {

  final dynamic option;

  PageA(this.option);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageA'), centerTitle: true,),
      body: Center(
        child: Text(option.query['page_key']),
      ),
    );
  }

}