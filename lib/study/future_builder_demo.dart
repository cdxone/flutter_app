import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:http/http.dart' as http;

class FutureBuilderDemo extends StatefulWidget {
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  var title = 'FutureBuilder请求网络数据的例子';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        ///FutureBuilder是一个将异步操作和异步UI更新结合在一起的类，通过它我们可以将网络请求，数据库读取等的结果更新的页面上。
        body: FutureBuilder(
            /// 用来请求异步的网络，或者异步的操作
            future: fetchPost(),
            /// 回调函数,必须有return
            /// AsyncSnapshot包含异步计算的信息，它具有如下属性
            /// connectionState:枚举ConnectionState的值，表示与异步计算的连接状态，ConnectionState有四个值：none，waiting，active和done；
            /// data - 异步计算接收的最新数据；
            /// error - 异步计算接收的最新错误对象；
            builder:
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('Input a URL to start');
                case ConnectionState.waiting://正在等待
                  return new Center(child: new CircularProgressIndicator());
                case ConnectionState.active:
                  return new Text('');
                case ConnectionState.done://完成
                  if (snapshot.hasError) {
                    return new Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('icon:${snapshot.data.icon}'),
                          Text(
                              'statusBarColor:${snapshot.data.statusBarColor}'),
                          Text('title:${snapshot.data.title}'),
                          Text('url:${snapshot.data.url}')
                        ]);
                  }
              }
              return null;
            }),
      ),
    );
  }

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder(); //fix 中文乱码
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.formJson(result);
  }
}
