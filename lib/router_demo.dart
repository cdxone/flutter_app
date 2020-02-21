import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class RouterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RouterDemo();
  }
}

class _RouterDemo extends State<RouterDemo> {
  bool _switchSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Router路由跳转',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Router路由跳转2'),
          //leading表示左边的地方
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text(_switchSelected ? '使用路由名称进行跳转' : '使用路由进行跳转'),
              value: _switchSelected,
              onChanged: (bool value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            RaisedButton(
              child: Text("跳转"),
              onPressed: () {
                if (_switchSelected) {
                  Navigator.pushNamed(context, '/less');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyApp();
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
