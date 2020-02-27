import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:flutter_app/view/my_title.dart';

/// 网络请求例子
class NetRequestDemo extends StatefulWidget {
  @override
  _NetRequestDemoState createState() => _NetRequestDemoState();
}

class _NetRequestDemoState extends State<NetRequestDemo> {
  String _title = '网络请求';

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                //fetchGet返回一个Future对象，它里面有一个then
                String url = 'https://www.devio.org/io/flutter_app/json/test_common_model.json';
                NetUtils.fetchGet(url).then((result) {
                  //将result转换为CommonModel，然后设置结果
                  CommonModel commonModel = CommonModel.formJson(result);
                  setState(() {
                    _result = commonModel.toString();
                  });
                });
              },
              child: Text('请求网络数据'),
            ),
            MyTitle('结果如下：'),
            Text(_result)
          ],
        ),
      ),
    );
  }
}

