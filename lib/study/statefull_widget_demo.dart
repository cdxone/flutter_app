import 'package:flutter/material.dart';

class StatefulWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetDemo();
  }
}

class _StatefulWidgetDemo extends State<StatefulWidgetDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 40);
    // 通常放在材料设计的根节点
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //可以设置AppBar的设置，底部导航栏的设置，body的设置
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // 点击底部执行的方法
          onTap: (index) {
            // 调用Stateful的特性setState来改变状态
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            // 导航栏要求必须有2个
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Icon(Icons.home, color: Colors.blue),
                title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.grey),
                activeIcon: Icon(Icons.list, color: Colors.blue),
                title: Text('列表')),
          ],
        ),
        // 悬浮按钮
        floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
        ),
        //body的地方放一个容器
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      // 设置居中方式
                      alignment: Alignment.center,
                      // child的地方放一个上下布局
                      child: Column(
                        //子孩子的地方，防止一個容器數組
                        children: <Widget>[
                          //有状态的组件
                          Image.network(
                            'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1417428654,683823429&fm=26&gp=0.jpg',
                            width: 200,
                            height: 200,
                          ),
                          TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                                labelText: "用户名",
                                hintText: "用户名或邮箱",
                                prefixIcon: Icon(Icons.person)),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(color: Colors.lightBlue),
                            child: PageView(
                              children: <Widget>[
                                _item('page1',Colors.blue),
                                _item('page2',Colors.green),
                                _item('page3',Colors.red),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Text('文案'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 2000));
    return null;
  }

  _item(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(text,style: TextStyle(fontSize: 22,color: Colors.black),),
    );
  }
}
