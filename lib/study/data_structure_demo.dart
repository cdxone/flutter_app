import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/my_stateful_widget_appbar.dart';

class DataStructureDemo extends MyStatefulWidgetAppbar {

  @override
  String getTitle() {
    return '数据结构的练习';
  }

  @override
  Widget getBody() {
    return Center(
      child: Text('代码中有例子'),
    );
  }

  @override
  initState() {
    testInt();
    testString();
    testDouble();
  }

  void testInt() {
    //将int类型转换为String类型
    int value = 5;
    print(value.toString());
  }

  void testString() {
    //String转int
    String value = '6';
    print(int.parse(value));

    // String转double
    print(double.parse('1.1'));

    //插值表达式
    //${expression}
    //如果只有一个变量，可以省略{}
    int a = 1;
    int b = 2;
    print("a + b = ${a + b}");//结果如下：a + b = 3
    print("a = $a");
  }

  void testDouble() {
    //double转String
    String piStr = 3.141592.toStringAsFixed(3); //结果为3.141
  }
}
