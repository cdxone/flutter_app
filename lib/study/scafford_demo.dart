import 'package:flutter_app/study/scaffold_navigationbar_demo.dart';
import 'package:flutter_app/study/scafford_tabbar.dart';
import 'package:flutter_app/study/scafford_tabbar_demo2.dart';
import 'package:flutter_app/view/my_list_view.dart';

class ScaffoldDemo extends MyListViewPage {


  static String pageTitle = 'Scafford的例子';
  static List<Map> items = [
    {'title': 'Scaffold实现顶部导航例子', 'route': ScaffoldTabBarDemo()},
    {'title': 'Scaffold实现顶部导航例子2', 'route': ScaffoldTabBarDemo2()},
    {'title': 'Scaffold + Navi实现底部导航', 'route': ScaffoldNavigationBarDemo()},
  ];

  ScaffoldDemo() : super(pageTitle, items);

}
