import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/toast.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;
  AnimationStatus animationStatus;
  double animationValue;
  int animationIntValue;

  @override
  void initState() {
    super.initState();
    // vsync时会防止屏幕外动画消耗不必要的资源，可以将stateful对象作为vsync的值。
    animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);
    // 这种形式比较特殊
    animation = Tween<double>(begin: 0.0,end: 300.0).animate(animationController)
      ..addListener((){
        setState(() {
          animationValue = animation.value;
          //细节：将double转换为int,先转换为String类型，然后转换为int
          animationIntValue = int.parse(animationValue.toStringAsFixed(0));
        });
      })
      ..addStatusListener((AnimationStatus status){
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tween例子',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tween例子'),
        ),
        body: (
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text('开启动画'),
                onPressed: (){
                  animationController.reset();
                  animationController.forward();
                },
              ),
              Text('${animationIntValue}'),
              Text('状态：$animationStatus'),
              Center(
               child: Container(
                 width: animationValue,
                 height: animationValue,
                 child: FlutterLogo(),
               ),
              )
            ],
          )
        ),
      ),
    );
  }
}


