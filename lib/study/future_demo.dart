import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/toast.dart';
import 'package:flutter_app/view/my_title.dart';

// ignore: must_be_immutable
class FutureDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  String _result = ' ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future的相关用法'),
        ),
        body: Column(
          children: <Widget>[
            MyTitle('结果'),
            Text(_result),
            RaisedButton(
              onPressed: () {
                _test(3);
              },
              child: Text('捕获Future的异常'),
            ),
            RaisedButton(
              onPressed: () {
                _test(2);
              },
              child: Text('获取Future中的结果'),
            ),
            RaisedButton(
              onPressed: () {
                testDealyed();
              },
              child: Text('Future.delayed的使用'),
            ),
            RaisedButton(
              onPressed: () {
                testAsyncAwait();
              },
              child: Text('Future + async + await 将异步转换为同步'),
            )
          ],
        ),
      ),
    );
  }

  Future<String> testFuture(int type) {
    if (type == 1) {
      // 返回这种形式，然后调用then方法，发现不执行回调
      throw new Error();
    } else if (type == 2) {
      return Future.value('success');
    } else if (type == 3) {
      return Future.error('error');
    } else {
      // 返回这种形式，然后调用then方法，发现不执行回调
      return null;
    }
  }

  void _test(int type) {
    // 注意 then里面onError的位置
    // 如果onError和catchError同事存在，那么只会调用onError
    testFuture(type).then((res) {
      setState(() {
        _result = res;
      });
    }, onError: (e) {
      setState(() {
        _result = e;
      });
    }).catchError((e) {
      _result = e;
    });
  }

  void testDealyed() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _result = 'Future.delayed执行完毕';
      });
    });
  }

  /// 加上async将同步的方法转换为异步
  void testAsyncAwait() async {
    ///加上await用来获取异步获取的数据，否则是不能获取的
    int result = await Future.delayed(Duration(seconds: 1), () {
      return Future.value(10);
    });
    Toast.toast(context, msg: 'Future+ async + await获取数据成功,result:$result');
  }
}
