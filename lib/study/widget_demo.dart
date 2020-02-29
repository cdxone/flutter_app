import 'package:flutter_app/study/opacity_demo.dart';
import 'package:flutter_app/study/scafford_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

import 'expansion_tile_demo.dart';
import 'fractionally_sized_box_demo.dart';
import 'listview_demo.dart';

class WidgetDemo extends MyListViewPage {

  static String pageTitle = '组件的例子';
  static List<Map> items = [
    {'title': 'ExpansionTile:可展开的列表', 'route': ExpansionTileDemo()},
    {'title': 'FractionallySizedBox:比例控件', 'route': FractionallySizedBoxDemo()},
    {'title': 'ListView', 'route': ListViewDemo()},
    {'title': 'Opacity:透明度控件', 'route': OpacityDemo()},
    {'title': 'Scafford:脚手架控件', 'route': ScaffoldDemo()},
  ];

  WidgetDemo() : super(pageTitle, items);
}