import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/study/share_preference_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class DataStoreDemo extends MyListViewPage {

  static String pageTitle = '动画的例子';
  static List<Map> items = [
    {'title': 'SharedPreference', 'route': SharePreferenceDemo()},
  ];

  DataStoreDemo() : super(pageTitle, items);
}
