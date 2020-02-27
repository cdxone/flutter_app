import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDemo extends StatefulWidget {
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Image的几个用法',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Image的几个用法'),
          ),
          // 如果想放入一个可以滚动的Column,可以使用ListView
          body: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text('5、Image的placeHolder'),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Center(child: CircularProgressIndicator()),
                    Center(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'http://www.devio.org/img/avatar.png',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text('1、Image加载网路图片'),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: // 通过Image.network构造的形式来加载网络图片
                      Image.network(
                    'https://www.devio.org/img/avatar.png',
                    width: 200,
                    height: 200,
                  )),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text('2、Image加载静态图片的第一种方法：使用普通构造，加载不同分辨率的图片'),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child:
                      //加载静态图片
                      //1、需要在pubspec.yaml中申明静态图片
                      //2、然后在项目中使用
                      //因为定义了宽高，所以显示有点不一样
                      Image(
                    width: 200,
                    height: 200,
                    image: AssetImage('images/test.png'),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text('3、Image加载静态图片的第二种方法：使用Image.asset构造，加载不同分辨率的图片'),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child:
                      //加载静态图片
                      //1、需要在pubspec.yaml中申明静态图片
                      //2、然后在项目中使用
                      Image.asset(
                    'images/test.png',
                    width: 200,
                    height: 200,
                  )),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text('4、Image加载本地图片（加载SD卡中的图片）,没有实现，本地图片没有'),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child:
                      //加载静态图片
                      //1、需要在pubspec.yaml中申明静态图片
                      //2、然后在项目中使用
                      Image.file(File(
                          '/storage/emulated/0/Android/data/com.example.flutter_app/files/Pictures/e4296688-0841-403d-ab61-2ee678175d3a7652690135252248923.jpg'))),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text('6、Image从网络上加载图片，并且将它缓存到本地'),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Center(
                  // 第一次使用的时候没有加载出来，重新运行了一下，加载出来了
                  child: CachedNetworkImage(
                    placeholder: (context, url) => new CircularProgressIndicator(),
                    imageUrl:
                    'https://www.devio.org/img/avatar.png',
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _getPictures();
  }

  Future<File> _getPictures() async {
    // /storage/emulated/0/Android/data/com.example.flutter_app/files
    String dir = (await getExternalStorageDirectory()).path;
    print(dir);
    // 获取这个文件下面的文件
    Directory directory = Directory(dir);
    List<FileSystemEntity> files = directory.listSync();
    print(files);
    // 获取第一个文件的路劲
    String picDir = files[0].path;
    print(picDir);
    // 获取文件夹下的文件
    directory = Directory(picDir);
    files = directory.listSync();
    print(files);
  }
}
