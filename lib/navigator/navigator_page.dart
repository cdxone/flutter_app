import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/my_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/travel_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  String _title = 'Scaffold + NavigationBar 实现底部导航';
  PageController _controller;
  Color _defaultColor = Colors.grey;
  Color _activeColor = Colors.blue;

  // 必须要初始化，否则容易出现问题
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: PageView(
          controller: _controller,
          children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            //fixed表示文字和图标都显示，shifting：表示选中的时候显示文字，其余情况下不显示文字
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              // 联动
              _controller.jumpToPage(index);
              // 设置值
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: _activeColor,
                  ),
                  title: Text(
                    '首页',
                    style: TextStyle(
                        color:
                            _currentIndex == 0 ? _activeColor : _defaultColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.search,
                    color: _activeColor,
                  ),
                  title: Text(
                    '搜索',
                    style: TextStyle(
                        color:
                            _currentIndex == 1 ? _activeColor : _defaultColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.camera_alt,
                    color: _activeColor,
                  ),
                  title: Text(
                    '旅拍',
                    style: TextStyle(
                        color:
                            _currentIndex == 2 ? _activeColor : _defaultColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.account_circle,
                    color: _activeColor,
                  ),
                  title: Text(
                    '我的',
                    style: TextStyle(
                        color:
                            _currentIndex == 3 ? _activeColor : _defaultColor),
                  ))
            ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
