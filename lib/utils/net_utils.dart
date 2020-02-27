import 'dart:convert';

import 'package:http/http.dart' as http;

/// 网络请求的工具类
class NetUtils{

  ///get请求
  static Future fetchGet(String url) async {
    final response = await http.get(url);
    //将response转换为map对象
    final result = json.decode(response.body);
    return result;
  }

}