import 'package:flutter/material.dart';
import 'package:flutter_app/image_demo.dart';
import 'package:flutter_app/utils/toast.dart';

import 'icon_demo.dart';

class StatefulWidgetDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetDemo2();
  }
}

class _StatefulWidgetDemo2 extends State<StatefulWidgetDemo2> {
  final List<Map> entries = [
    {'title': 'Icon组件的例子', 'route': IconDemo()},
    {'title': 'Image组件的例子', 'route': ImageDemo()},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget的例子',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter例子大全'),
        ),
        //body的地方放一个容器
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Toast.toast(context, msg: 'index:$index');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => entries[index]['route']));
              },
              child: Container(
                height: 50,
                color: Colors.amber[600],
                child: Center(child: Text('${entries[index]['title']}')),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
        ),
      ),
    );
  }
}





