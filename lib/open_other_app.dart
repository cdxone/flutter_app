import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenOtherApp extends StatefulWidget {
  @override
  _OpenOtherAppState createState() => _OpenOtherAppState();
}

class _OpenOtherAppState extends State<OpenOtherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('打开第三方应用'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _launchURL();
              },
              child: Text('跳转到浏览器'),
            ),
            RaisedButton(
              onPressed: () {
                _openMap();
              },
              child: Text('跳转到地图'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openMap() async{
    // geo 这是一个scheme，得去高德的地图注册寻找
    const url = 'geo:52.32,4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //IOS
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if(await canLaunch(url)){
        await launch(url);
      }
      throw 'Could not launch $url';
    }
  }
}
