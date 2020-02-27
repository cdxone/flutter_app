import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

///如何获取Flutter应用维度生命周期
///WidgetsBindingObserver：是一个Widgets绑定观察器，通过它我们可以监听应用的生命周期、语言等的变化
class AppLifeCycleDemo extends StatefulWidget {
  @override
  _AppLifeCycleDemoState createState() => _AppLifeCycleDemoState();
}

//必须要通过with来实现这个Observer
class _AppLifeCycleDemoState extends State<AppLifeCycleDemo>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      print('App进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('App进去前台');
    } else if (state == AppLifecycleState.inactive) {
      print('---inactive---');
      //不常用：应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
    }
//     else if (state == AppLifecycleState.suspending) {
//       //不常用：应用程序被挂起是调用，它不会在iOS上触发
//     }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
