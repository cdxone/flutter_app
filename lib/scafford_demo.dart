import 'package:flutter_app/open_other_app.dart';
import 'package:flutter_app/scafford_tabbar.dart';
import 'package:flutter_app/scafford_tabbar_demo2.dart';
import 'package:flutter_app/view/my_list_view.dart';

class ScaffoldDemo extends MyListViewPage {


  static String pageTitle = 'Scafford的例子';
  static List<Map> items = [
    {'title': 'Scaffold实现顶部导航例子', 'route': ScaffoldTabBarDemo()},
    {'title': 'Scaffold实现顶部导航例子2', 'route': ScaffoldTabBarDemo2()},
  ];

  ScaffoldDemo() : super(pageTitle, items);

}
