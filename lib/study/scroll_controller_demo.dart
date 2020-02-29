import 'package:flutter_app/study/scroll_controller_test1_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class ScrollControllerDemo extends MyListViewPage{

  static String pageTitle = '动画的例子';
  static List<Map> items = [
    {'title': 'ScrollController实现加载更多', 'route': ScrollControllerTest1Demo()},
  ];

  ScrollControllerDemo() : super(pageTitle, items);

}