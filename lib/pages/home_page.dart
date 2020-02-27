import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
