import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenTest1Demo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();

}

class _TweenDemoState extends State<TweenTest1Demo> with SingleTickerProviderStateMixin{

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
    animation = Tween<double>(begin: 0.0,end: 300.0).animate(animationController);
    animationController.forward();
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
        body: AnimatedLogo(animationController,animation: animation,),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}

/// AnimatedWidget的情况下需要手动调用动画的addListener()并在回调中添加setState才能看到动画效果，AnimatedWidget将为我们简化这一操作。
class AnimatedLogo extends AnimatedWidget {
  AnimationController _control;
  AnimatedLogo(this._control,{Key key, Animation<double> animation,})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          child: Text('开启动画'),
          onPressed: (){
            // 重置动画
            _control.reset();
            // 开启动画
            _control.forward();
          },
        ),
        Text('${animation.status}'),
        Text('${animation.value}'),
        Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(),
          ),
        )
      ],
    );
  }
}


