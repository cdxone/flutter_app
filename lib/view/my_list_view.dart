import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/toast.dart';

/// 封装了ListView点击的效果
class MyListViewPage extends StatefulWidget {
  String _title;
  List<Map> entries;

  MyListViewPage(this._title, this.entries);

  @override
  _MyListViewState createState() => _MyListViewState(_title, entries);
}

class _MyListViewState extends State<MyListViewPage> {
  String _title;
  List<Map> entries;

  _MyListViewState(this._title, this.entries);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Toast.toast(context, msg: 'index:$index');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => entries[index]['route']));
              },
              child: Container(
                height: 50,
                color: Colors.amber[600],
                child: Center(child: Text('${entries[index]['title']}')),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
