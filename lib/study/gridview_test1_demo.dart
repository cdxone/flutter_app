import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

class GridViewTest1Demo extends StatefulWidget {
  @override
  _GridViewTest1DemoState createState() => _GridViewTest1DemoState();
}

class _GridViewTest1DemoState extends State<GridViewTest1Demo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
          appBar: AppBar(
            title: Text('GridView的例子'),
          ),
          //我们通常使用GridView.count构造函数来创建一个GridView.
          body:Container(
            margin: EdgeInsets.only(left: 2,bottom: 2),
            child: GridView.count(
              crossAxisCount: 2,
              children: _buildList(),
            )),
          )
    );
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((String city){
      return Container(
        height: 100,
        margin: EdgeInsets.only(right: 2,top: 2),
        decoration: BoxDecoration(color: Colors.teal),
        child: Center(
          child: Text(city),
        ),
      );
    }).toList();
  }
}
