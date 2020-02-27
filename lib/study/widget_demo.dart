import 'package:flutter_app/study/scafford_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class WidgetDemo extends MyListViewPage {

  static String pageTitle = '组件的例子';
  static List<Map> items = [
    {'title': 'Scafford', 'route': ScaffoldDemo()},
  ];

  WidgetDemo() : super(pageTitle, items);
}