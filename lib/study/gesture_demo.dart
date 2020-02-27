import 'package:flutter/material.dart';

class GestureDemo extends StatefulWidget {
  @override
  _GestureDemoState createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  String _printMsg = '';
  double _left = 0;
  double _top = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测用户的手势'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _print('点击');
                    },
                    onDoubleTap: (){
                      _print('双击');
                    },
                    onLongPress: (){
                      _print('长按');
                    },
                    onTapCancel: (){
                      _print('取消');
                    },
                    onTapUp: (details){
                      _print('松开');
                    },
                    onTapDown: (details){
                      _print('按下');
                    },
                    child: Container(
                      padding: EdgeInsets.all(60),
                      color: Colors.blue,
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.all(60),
                    ),
                  ),
                  Text('$_printMsg')
                ],
              ),
              Positioned(
                top: _top,
                left: _left,
                child: GestureDetector(
                  // 手指放上去，拖动的过程中，此方法会被回调,然后用方法进行接收
                  onPanUpdate:(e) => _doMove(e),
                  child: Icon(Icons.ac_unit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _print(String msg) {
    setState(() {
      _printMsg += ' $msg';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      //触摸过程中，取出x和y轴的值
      _left += e.delta.dx;
      _top += e.delta.dy;
    });
  }
}
