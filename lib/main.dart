import 'package:flutter/material.dart';
import 'package:flutter_app/study/AnimationDemo.dart';
import 'package:flutter_app/study/ChangeFontDemo.dart';
import 'package:flutter_app/study/app_life_cycle_demo.dart';
import 'package:flutter_app/study/apps_demo.dart';
import 'package:flutter_app/study/change_theme_demo.dart';
import 'package:flutter_app/study/data_structure_demo.dart';
import 'package:flutter_app/study/flutter_layout_demo.dart';
import 'package:flutter_app/study/future_builder_demo.dart';
import 'package:flutter_app/study/future_demo.dart';
import 'package:flutter_app/study/gesture_demo.dart';
import 'package:flutter_app/study/life_cycle_demo.dart';
import 'package:flutter_app/study/net_rquest_demo.dart';
import 'package:flutter_app/study/open_other_app.dart';
import 'package:flutter_app/study/photo_demo.dart';
import 'package:flutter_app/study/res_demo.dart';
import 'package:flutter_app/study/router_demo.dart';
import 'package:flutter_app/study/stateful_widget_demo2.dart';
import 'package:flutter_app/study/statefull_widget_demo.dart';
import 'package:flutter_app/study/stateless_widget_demo.dart';
import 'package:flutter_app/study/widget_demo.dart';
import 'package:flutter_app/utils/toast.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }


}

class _MyApp extends State<MyApp> {
  final List<Map> entries = [
    {'title': '数据结构', 'route': DataStructureDemo()},
    {'title': '动画例子', 'route': AnimationDemo()},
    {'title': '组件例子', 'route': WidgetDemo()},
    {'title': '网络请求', 'route': NetRequestDemo()},
    {'title': '应用实例', 'route': AppsDemo()},
    {'title': 'Future用法', 'route': FutureDemo()},
    {'title': 'FutureBuilder用法', 'route': FutureBuilderDemo()},
    {'title': 'StatelessWidget组件及其子组件例子', 'route': StatefulWidgetDemo2()},
    {'title': 'StatelessWidget组件及其子组件例子', 'route': StatelessWidgetDemo()},
    {'title': 'StatefulWidget组件及其子组件例子', 'route': StatefulWidgetDemo()},
    {'title': 'Flutter容器的例子', 'route': FlutterLayoutDemo()},
    {'title': '路由跳转的例子', 'route': RouterDemo()},
    {'title': 'Gesture的例子', 'route': GestureDemo()},
    {'title': '如何导入和使用Flutter的例子', 'route': ResDemo()},
    {'title': '如何打开第三方应用的例子', 'route': OpenOtherApp()},
    {'title': 'Flutter页面的生命周期', 'route': LifeCycleDemo()},
    {'title': 'Flutter应用的生命周期', 'route': AppLifeCycleDemo()},
    {'title': '如何修改Flutter的主题', 'route': ChangeThemeDemo()},
    {'title': '如何修改字体', 'route': ChangeFontDemo()},
    {'title': '拍照App', 'route': PhotoApp()},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyApp(),
        '/less': (BuildContext context) => StatelessWidgetDemo(),
        '/ful': (BuildContext context) => StatefulWidgetDemo(),
        '/container': (BuildContext context) => FlutterLayoutDemo(),
        '/router': (BuildContext context) => RouterDemo(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter例子大全'),
        ),
        //body的地方放一个容器
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
