import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/10/c2/23151595_1373424485109.jpg',
    'http://pic1.win4000.com/wallpaper/f/5462f445e47ff.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582794098174&di=d7c8d6841c1b67c402ae1600ff27cbe9&imgtype=0&src=http%3A%2F%2Fimg02.tooopen.com%2Fimages%2F20150613%2Ftooopen_sy_130104869369.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // 此API用来移除顶部的padding
    return MediaQuery.removePadding(
        // 需要制定这个属性，来移除哪个位置的padding
        removeTop: true,
        context: context,
        //ListView顶部有一个Padding，这样体验是不好的
        child: ListView(
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
            )
          ],
        ));
  }
}
