import 'package:flutter/material.dart';

class FlutterLayoutDemo extends StatelessWidget {
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
          //body的地方放一个容器
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                      child: SizedBox(
                    child:
                        Image.network('https://www.devio.org/img/avatar.png'),
                    width: 100,
                    height: 100,
                  )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Opacity(
                            opacity: 0.3,
                            child: Image.network(
                              'https://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Opacity(
                            opacity: 0.3,
                            child: Image.network(
                              'https://www.devio.org/img/avatar.png',
                              width: 60,
                              height: 60,
                            )),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  PhysicalModel(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.transparent,
                    child: Image.network(
                      'https://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  // 展示沾满全屏
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      margin: EdgeInsets.only(top: 20),
                      child: Text('文字'),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                //堆叠布局
                child: Stack(
                  children: <Widget>[
                    Image.network('https://www.devio.org/img/avatar.png',width: 100,height: 100,),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.network('https://www.devio.org/img/avatar.png',width: 50,height: 50,),
                    ),
                  ],
                ),
              ),
              //从左到右排列,可以换行
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  _chip('FlutterFlutter'),
                  _chip('Java'),
                  _chip('IOS'),
                  _chip('Android'),
                  _chip('Php'),
                  _chip('Web'),
                ],
              ),
              //填充，由于是
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  width: 100,
                ),
              )
            ],
          )),
    );
  }

  _chip(String msg) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(msg.substring(0,1)),
      ),
      label: Text(msg),
    );
  }
}
