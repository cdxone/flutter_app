import 'package:flutter_app/view/my_list_view.dart';

import 'listview_test1_demo.dart';
import 'listview_test2_demo.dart';

class ListViewDemo extends MyListViewPage{

  static String pageTitle = 'ListView的例子';
  static List<Map> items = [
    {'title': 'ListView实现竖直滚动', 'route': ListViewTest1Demo()},
    {'title': 'ListView实现水平滚动', 'route': ListViewTest2Demo()},
  ];

  ListViewDemo() : super(pageTitle, items);

}
