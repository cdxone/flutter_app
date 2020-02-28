import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/my_stateful_widget_appbar.dart';
import 'package:flutter_app/view/my_title.dart';

class GoodWebsiteDemo extends MyStatefulWidgetAppbar{


  Widget getBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyTitle('Json转换为Dart网站'),
        Text('https://www.devio.org/io/tools/json-to-dart/')
      ],
    );
  }

}