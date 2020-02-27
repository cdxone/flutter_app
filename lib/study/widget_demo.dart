import 'package:flutter_app/study/opacity_demo.dart';
import 'package:flutter_app/study/scafford_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class WidgetDemo extends MyListViewPage {

  static String pageTitle = '组件的例子';
  static List<Map> items = [
    {'title': 'Opacity:透明度控件', 'route': OpacityDemo()},
    {'title': 'Scafford:脚手架控件', 'route': ScaffoldDemo()},
  ];

  WidgetDemo() : super(pageTitle, items);
}