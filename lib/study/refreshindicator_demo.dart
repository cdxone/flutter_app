import 'package:flutter/cupertino.dart';
import 'package:flutter_app/study/refreshIndicator_test1_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class RefreshIndicatorDemo extends MyListViewPage{
  static String pageTitle = '动画的例子';
  static List<Map> items = [
    {'title': 'RefreshIndicator的例子', 'route': RefreshIndicatorTest1Demo()},
  ];

  RefreshIndicatorDemo() : super(pageTitle, items);
}
