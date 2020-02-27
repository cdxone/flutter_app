import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//如何自定义字体
///1、字体下载地址：谷歌字体库下载字体 https://fonts.google.com/specimen/Rubik+Mono+One?selection.family=Rubik+Mono+One
///下载下来字体以后，然后进行解压，然后得到一个ttf的文件。
///2、然后我们在项目里面创建一个文件夹，比如叫做fonts,然后将这个字体放入fonts文件夹下。
///3、然后在pubspec.yaml文件中，按照提示的配置文件进行配置，完成字体的一个注册，然后点击最上部的Packages get完成注册。
class ChangeFontDemo extends StatefulWidget {
  @override
  _ChangeFontDemoState createState() => _ChangeFontDemoState();
}

class _ChangeFontDemoState extends State<ChangeFontDemo> {
  String _fontFamily = 'RubikMonoOne';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: _fontFamily),
      home: Scaffold(
        appBar: AppBar(
          title: Text("修改页面字体"),
          leading: BackButton(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_fontFamily == 'RubikMonoOne') {
                    _fontFamily = '';
                  } else {
                    _fontFamily = 'RubikMonoOne';
                  }
                });
              },
              child: Text('全局修改页面的字体'),
            ),
            Text(
              '局部修改页面的字体',
              style: TextStyle(color: Colors.red, fontSize: 16,fontFamily: 'RubikMonoOne'),
            ),
            Text(
              '扩展abc:(由于这个字体是英文，所以只对英文起作用)',
              style: TextStyle(color: Colors.red, fontSize: 16,fontFamily: 'RubikMonoOne'),
            ),
            Text(
              '如何修改项目里面所有页面的字体？',
            ),
            Text('首先我全局定义一个变量，然后每个页面都使用这个变量,这样就可以实现一个地方修改主题，所有的月面都生效Good'),
            Text('abcdefg')
          ],
        ),
      ),
    );
  }
}
