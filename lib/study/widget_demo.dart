import 'package:flutter_app/study/opacity_demo.dart';
import 'package:flutter_app/study/refreshindicator_demo.dart';
import 'package:flutter_app/study/scafford_demo.dart';
import 'package:flutter_app/study/scroll_controller_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

import 'expansion_tile_demo.dart';
import 'fractionally_sized_box_demo.dart';
import 'gridview_demo.dart';
import 'listview_demo.dart';

class WidgetDemo extends MyListViewPage {

  static String pageTitle = '组件的例子';
  static List<Map> items = [
    {'title': 'ExpansionTile:可展开的列表', 'route': ExpansionTileDemo()},
    {'title': 'FractionallySizedBox:比例控件', 'route': FractionallySizedBoxDemo()},
    {'title': 'GridView:网格布局', 'route': GridViewDemo()},
    {'title': 'ListView', 'route': ListViewDemo()},
    {'title': 'Opacity:透明度控件', 'route': OpacityDemo()},
    {'title': 'RefreshIndicator:下拉刷新组件', 'route': RefreshIndicatorDemo()},
    {'title': 'Scafford:脚手架控件', 'route': ScaffoldDemo()},
    {'title': 'ScrollController:滚动监听', 'route': ScrollControllerDemo()},
  ];

  WidgetDemo() : super(pageTitle, items);
}