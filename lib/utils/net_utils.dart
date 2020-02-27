import 'dart:convert';

import 'package:http/http.dart' as http;

/// 网络请求的工具类
class NetUtils{

  static Future fetchGet(String url) async {
    final response = await http.get(url);
    final result = json.decode(response.body);
    return result;
  }

}