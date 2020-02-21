import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/toast.dart';


abstract class MyListView extends StatefulWidget {

  final List<Map> entries;

  MyListView(this.entries){
    print('fu');
    print(this.entries);
  }

  @override
  _MyListViewState createState() => _MyListViewState(entries);
}

class _MyListViewState extends State<MyListView> {

  final List<Map> entries;

  _MyListViewState(this.entries);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter例子大全'),
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
