import 'package:flutter_app/view/my_list_view.dart';

import 'gridview_test1_demo.dart';

class GridViewDemo extends MyListViewPage{

  static String pageTitle = 'GridView的例子';
  static List<Map> data = [
    {'title':'GridView的例子','route':GridViewTest1Demo()},
  ];

  GridViewDemo() : super(pageTitle, data);

}