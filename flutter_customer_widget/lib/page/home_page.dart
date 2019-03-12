import 'package:flutter/material.dart';
import '../widget/bottom_tab_widget.dart';
import './home_base_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _curTab;

  @override
  void initState() {
    super.initState();
    _curTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            IndexedStack(
              index: _curTab,
              children: <Widget>[
                HomeBasePage(
                  bottom: 50,
                  child: Center(
                    child: Text('Popular'),
                  ),
                ),
                HomeBasePage(
                  bottom: 50,
                  child: Center(
                    child: Text('Trending'),
                  ),
                ),
                HomeBasePage(
                  bottom: 50,
                  child: Center(
                    child: Text('Favorite'),
                  ),
                ),
                HomeBasePage(
                  bottom: 50,
                  child: Center(
                    child: Text('My'),
                  ),
                ),
              ],
            ),
            BottomTabWidget(
              onTabChange: (index) {
                setState(() {
                  _curTab = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
