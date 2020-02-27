import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 封装了StatefulWidget的MaterialApp和Scafolld
/// 使用的页面重写getTitle和getBody就行了，没有必须都进行重写
abstract class MyStatefulWidgetAppbar extends StatefulWidget with Params{

  MyStatefulWidgetAppbar();

  @override
  _MyStatefulWidgetAppbarState createState() => _MyStatefulWidgetAppbarState(this);
}

class _MyStatefulWidgetAppbarState extends State<MyStatefulWidgetAppbar> {

  Params _params;

  _MyStatefulWidgetAppbarState(this._params);


  @override
  void initState() {
    _params.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_params.getTitle()),
        ),
        body: _params.getBody(),
      ),
    );
  }
}

class Params{
  String getTitle(){
    return ' ';
  }

  Widget getBody(){
    return Text('');
  }

  initState(){

  }
}

