import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerTest1Demo extends StatefulWidget {
  @override
  _ScrollControllerTest1DemoState createState() => _ScrollControllerTest1DemoState();
}

class _ScrollControllerTest1DemoState extends State<ScrollControllerTest1Demo> {

  List<String> cityNames = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      // 位置 == 最大可移动的位置，说明移动到末尾了
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = '高级功能列表下拉刷新与上拉加载更多功能实现';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            controller: _scrollController,
            children: _buildList(),
          ),
        ),
      ),
    );
  }

  _loadData() async {
    // 延时，模拟网路环境
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      //复制数组
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
