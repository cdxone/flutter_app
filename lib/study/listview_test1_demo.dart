import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewTest1Demo extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListViewTest1Demo> {

  List<String> CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView实现竖直滚动'),
        ),
        body: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    // 必须要将Map转换为List
    return CITY_NAMES.map((city)=>_item(city)).toList();
  }

 Widget _item(String city) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Center(
        child: Text(city),
      ),
    );
  }
}
