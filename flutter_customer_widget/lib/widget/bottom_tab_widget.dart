import 'package:flutter/material.dart';

class BottomTabWidget extends StatefulWidget {

  final Function(int) onTabChange;

  BottomTabWidget({@required this.onTabChange});

  @override
  State<StatefulWidget> createState() => BottomTabWidgetState();
}

class BottomTabWidgetState extends State<BottomTabWidget> {
  List<dynamic> bottomTabs;
  List<String> iconAssets;
  List<Color> colors;
  int currentTab;

  @override
  void initState() {
    super.initState();

    currentTab = 0;

    bottomTabs = [
      {'name': 'Popular', 'page': 0},
      {'name': 'Trending', 'page': 1},
      {'name': 'Favorite', 'page': 2},
      {'name': 'My', 'page': 3},
    ];

    iconAssets = [
      'assets/bottom_tab/ic_popular.png',
      'assets/bottom_tab/ic_trending.png',
      'assets/bottom_tab/ic_favorite.png',
      'assets/bottom_tab/ic_my.png',
    ];

    colors = [
      Colors.orange,
      Colors.grey,
      Colors.grey,
      Colors.grey,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 50,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: bottomTabs.map((data) {
            return Expanded(
              child: _buildBottomIcon(data),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBottomIcon(dynamic map) {
    String name = map['name'];
    int index = map['page'];
    String iconAssetsPath = iconAssets[index];
    return GestureDetector(
      onTap: () {
        if (currentTab == index) {
          return;
        }
        currentTab = index;
        widget.onTabChange(currentTab);
        setState(() {
          for (int i = 0; i < colors.length; i++) {
            if (i == currentTab) {
              colors[currentTab] = Colors.orange;
            } else {
              colors[i] = Colors.grey;
            }
          }
        });
      },
      child: Center(
        child: Column(
          children: <Widget>[
            Divider(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.only(top: 2.0),
              child: Image.asset(
                iconAssetsPath,
                width: 26,
                height: 26,
                color: colors[index],
              ),
            ),
            Text(name, style: TextStyle(color: colors[index]),),
          ],
        ),
      ),
    );
  }
}
