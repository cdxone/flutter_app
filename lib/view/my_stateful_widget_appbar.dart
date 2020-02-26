import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 封装了StatefulWidget的MaterialApp和Scafolld
/// 使用的页面重写getTitle和getBody就行了，没有必须都进行重写
abstract class MyStatefulWidgetAppbar extends StatefulWidget {

  MyStatefulWidgetAppbar();

  String getTitle();

  Widget getBody();

  @override
  _MyStatefulWidgetAppbarState createState() => _MyStatefulWidgetAppbarState(getTitle(),getBody());
}

class _MyStatefulWidgetAppbarState extends State<MyStatefulWidgetAppbar> {

  String _title;
  Widget _body;

  _MyStatefulWidgetAppbarState(this._title,this._body);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _body,
      ),
    );
  }
}

