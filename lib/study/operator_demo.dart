import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/my_stateful_widget_appbar.dart';

class OperatorDemo extends MyStatefulWidgetAppbar {
  @override
  String getTitle() {
    return '操作符的例子';
  }

  @override
  Widget getBody() {
    return Center(
      child: Text('操作符的例子都在代码里面'),
    );
  }

  @override
  initState() {
    /*
      算术运算符
      加减乘除
        + - % / ~/ %
      递增递减
        ++var  var++  --var  var--
    */

    /*
    * 关系运算符
    * == ！= > < >= <=。
    *
    * */

    /*
    * 逻辑运算符
    * ！  &&  ||
    * */

    /*
    * 赋值运算符
    * 基础运算符
    * 1、=
    * 2、??=
    * 如果b没有赋值，那么？？=就是给他赋值。
    * 复合运算符
    * +=  -=  *= /= %=  ~/=
    * */
    int b;
    b ??= 10;
    print(b);

    int c = 5;
    c ??= 15;
    print(c);
  }
}
