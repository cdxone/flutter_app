import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;//透明度
  List<String> images = [
    'http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/10/c2/23151595_1373424485109.jpg',
    'http://pic1.win4000.com/wallpaper/f/5462f445e47ff.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582794098174&di=d7c8d6841c1b67c402ae1600ff27cbe9&imgtype=0&src=http%3A%2F%2Fimg02.tooopen.com%2Fimages%2F20150613%2Ftooopen_sy_130104869369.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // 此处想要增加一个AppBar，用Scaffold的AppBar是不行的，因为Scaffold的AppBar是固定的。
    // 所以我们想要实叠加的效果，我们采用Stack

    // 此API用来移除顶部的padding
    return Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          // 需要制定这个属性，来移除哪个位置的padding
          removeTop: true,
          context: context,
          //ListView顶部有一个Padding，这样体验是不好的
          // 为了监听ListView的滚动，我们需要增加一个NotificationListener
          child: NotificationListener(
              onNotification: (Notification notification){
                //说明，这个方法有的时候会在偏移量为0的时候，也会执行，所以我们得去判断
                //这个方法会监听ListView并且内部的元素的滚动，比如Swipe的滚动，但是我们只是想监听ListView，所以必须要进行过滤
                //notification.depth == 0 深度为0,表示为第一个元素
                if(notification is ScrollUpdateNotification && notification.depth == 0){
                  _scroll(notification.metrics.pixels);
                }
                return true;
              },
              child:  ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Swiper(
                          autoplay: true,
                          //自动博阿方
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              images[index],
                              fit: BoxFit.fill,
                            );
                          },
                          //构建图片
                          itemCount: 3,
                          //表示原点指示器
                          pagination: new SwiperPagination(),
                          //用来显示左右切换的图标
                          //control: new SwiperControl(),
                        ),
                      )
                    ],
                  ),
                  //Tile：万片 ListTile:列表块
                  ListTile(
                    title: Text('test'),
                  ),
                  Container(
                    height: 1000,
                    child: Text('xx'),
                    color: Colors.blue,
                  )
                ],
              )),
        ),
        Opacity(
          opacity: _opacity,
          child: Container(
            height: 80,
            color: Colors.white,
            // Center是全屏的组件
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('首页'),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// offset:偏移量
  void _scroll(double offset) {
    double rate = offset/100;
    if(rate < 0){
        rate = 0;
    } else if(rate > 1){
      rate = 1;
    }
    setState(() {
      _opacity = rate;
    });
  }
}
