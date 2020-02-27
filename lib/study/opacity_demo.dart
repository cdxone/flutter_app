import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/my_title.dart';

class OpacityDemo extends StatefulWidget {
  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyTitle('opacity: 0.5的例子'),
        Opacity(
          // 这个属性必须写上
          opacity: 0.5,
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
          ),
        ),
        MyTitle('没有opacity的例子'),
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
        )
      ],
    );
  }
}
