import 'package:flutter/material.dart';

class StatelessWidgetDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 40);
    // 通常放在材料设计的根节点
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
        ),
        // body的地方放一个容器
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          // 设置居中方式
          alignment: Alignment.center,
          // child的地方放一个上下布局
          child: Column(
            //子孩子的地方，防止一個容器數組
            children: <Widget>[
              Text('I am Text', style: textStyle),
              Icon(Icons.android, size: 50, color: Colors.red),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.photo),
                label: Text('Chip的使用'),
              ),
              // 分割綫的高度
              Divider(
                  height: 10, //容器的高度，不是线的高度
                  indent: 10, //左边的间距
                  color: Colors.orange),
              // 带有圆角、阴影、边框效果的卡片
              Card(
                color: Colors.blue,
                elevation: 5, //悬浮的高度
                margin: EdgeInsets.all(20), //上下左右的间距
                child: Container(
                  padding: EdgeInsets.all(30), //上下左右的间距
                  child: Text(
                    'I am Card',
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('盘他'),
                content: Text('糟老头子坏的很'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
