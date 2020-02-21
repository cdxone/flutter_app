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
}
