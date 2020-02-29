import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/my_stateful_widget_appbar.dart';

class ExpressionDemo extends MyStatefulWidgetAppbar{

  @override
  Widget getBody() {
    return Center(
      child: Text('表达式的例子在代码里面'),
    );
  }

  @override
  initState() {
    //三目运算符
    //condition ? expr1:expr2;

    //??运算符
    //expr1 ?? expr2
    //如果第一个表达式的值不为空，那么就使用第一个表达式的值
    //如果第一个表达式的值为空，那么就使用第二个表达式的值
    String str;
    String value = str ?? '你好';
    print(value);
  }
}
