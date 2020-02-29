import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorTest1Demo extends StatefulWidget {
  @override
  _RefreshIndicatorTest1DemoState createState() => _RefreshIndicatorTest1DemoState();
}

class _RefreshIndicatorTest1DemoState extends State<RefreshIndicatorTest1Demo> {

  List<String> CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

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
            children: _buildList(),
          ),
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

  // 如果返回Null,此处就写Null
  Future<Null> _handleRefresh () async{
    // 等待2秒
    await Future.delayed(Duration(seconds: 2));
    // 等待2秒，然后改变数据
    setState(() {
      CITY_NAMES = CITY_NAMES.reversed.toList();
    });
    return null;
  }
}
