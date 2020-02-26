import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/view/my_stateful_widget_appbar.dart';

class TweenDemo extends MyStatefulWidgetAppbar {

  @override
  Widget getBody() {
    return Text('test');
  }

  @override
  String getTitle() {

    return 'Tween例子';
  }

}

