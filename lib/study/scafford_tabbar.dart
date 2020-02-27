import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldTabBarDemo extends StatefulWidget {
  @override
  _ScaffoldTabBarDemoState createState() => _ScaffoldTabBarDemoState();
}

class _ScaffoldTabBarDemoState extends State<ScaffoldTabBarDemo> with SingleTickerProviderStateMixin{
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scafford_TabBar的例子',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scafford_TabBar的例子'),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: tabs.map((e) => Tab(text: e)).toList()
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
    );
  }
}

