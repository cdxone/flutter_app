import 'package:flutter/material.dart';

class IconDemo extends StatefulWidget {
  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon的例子',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon的例子'),
        ),
        body:Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Icon(Icons.android,size: 100,),
            ),
            Center(
              child: Icon(Icons.android,size: 100,color: Colors.red,),
            ),
            Container(
              margin: EdgeInsets.only(top:10,left: 10),
              alignment: Alignment.topLeft,
              child: Text('自定义Icon2\n https://segmentfault.com/a/1190000019750283'),
            ),
            Container(
              child: Center(
                child: Icon(
                    IconData(0xe6ef, fontFamily: 'iconFont'),
                    size: 100,
                    color: Colors.black
                ),
              ),
            ),

          ],
        )

      ),
    );
  }
}
