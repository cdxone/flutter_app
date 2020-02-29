import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/my_stateful_widget_appbar.dart';
import 'package:flutter_app/view/my_title.dart';

class FractionallySizedBoxDemo extends MyStatefulWidgetAppbar {

  @override
  Widget getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyTitle('Container + Text'),
        Container(
          decoration: BoxDecoration(color: Colors.lightBlue),
          margin: EdgeInsets.only(top: 20),
          child: Text('文字'),
        ),
        MyTitle('FractionallySizedBox + Container + Text 实现全屏'),
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
            margin: EdgeInsets.only(top: 20),
            child: Text('文字'),
          ),
        ),
        MyTitle('FractionallySizedBox + Container + Text 实现半屏'),
        FractionallySizedBox(
          widthFactor: 0.5,
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
            margin: EdgeInsets.only(top: 20),
            child: Text('文字'),
          ),
        )
      ],
    );
  }
}