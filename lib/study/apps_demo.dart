import 'package:flutter/cupertino.dart';
import 'package:flutter_app/study/xie_cheng_app_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class AppsDemo extends MyListViewPage {

  static String pageTitle = '动画的例子';
  static List<Map> items = [
    {'title': '携程网App', 'route': XieChengAppDemo()},
  ];

  AppsDemo() : super(pageTitle, items);

}

