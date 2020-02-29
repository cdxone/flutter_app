import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceDemo extends StatefulWidget {
  @override
  _SharePreferenceDemoState createState() => _SharePreferenceDemoState();
}

class _SharePreferenceDemoState extends State<SharePreferenceDemo> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SharePreference例子'),
        ),
        body: Column(
          children: <Widget>[
            Text(_result),
            RaisedButton(
              onPressed: _addCount,
              child: Text('增加数字'),
            ),
            RaisedButton(
              onPressed: _decreseCount,
              child: Text('减少数字'),
            ),
          ],
        ),
      ),
    );
  }

  void _addCount() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    // 使用条件表达式
    int count = instance.getInt('Count') ?? 0;
    int value = count + 1;
    print('value:$value');
    instance.setInt('Count', value);
    setState(() {
      _result = '$value';
    });
  }

  void _decreseCount() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    int count = instance.getInt('Count') ?? 0;
    int value = count - 1;
    instance.setInt('Count', value);
    setState(() {
      _result = '$value';
    });
  }
}
