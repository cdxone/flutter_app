import 'package:flutter_app/stateless_widget_demo.dart';
import 'package:flutter_app/view/my_list_view.dart';

class StatefulWidgetDemo2 extends MyListView {

  static List<Map> getData(){
    List<Map> result = [
      {'title':'xx','router':StatelessWidgetDemo()},
    ];
    return result;
  }

  StatefulWidgetDemo2(List<Map> entries) : super(entries){
    print('zi');
    print(entries);
  }

}

