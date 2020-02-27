import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeThemeDemo extends StatefulWidget {
  @override
  _ChangeThemeDemoState createState() => _ChangeThemeDemoState();
}

class _ChangeThemeDemoState extends State<ChangeThemeDemo> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, brightness: _brightness),
      home: Scaffold(
        appBar: AppBar(
          title: Text("修改页面主题"),
          leading: BackButton(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if(_brightness == Brightness.light){
                    _brightness = Brightness.dark;
                  } else {
                    _brightness = Brightness.light;
                  }
                });
              },
              child: Text('修改页面的主题'),
            ),
            Text('扩展:',style: TextStyle(color: Colors.red,fontSize: 24),),
            Text('如何修改项目里面所有页面的主题？',),
            Text('首先我全局定义一个变量，然后每个页面都使用这个变量,这样就可以实现一个地方修改主题，所有的月面都生效')
          ],
        ),
      ),
    );
  }
}
