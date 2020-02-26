import 'package:flutter_app/tween_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class AnimationDemo extends MyListViewPage {

  static String pageTitle = '动画的例子';
  static List<Map> items = [
    {'title': '利用Tween实现动画例子', 'route': TweenDemo()},
  ];

  AnimationDemo() : super(pageTitle, items);

}
