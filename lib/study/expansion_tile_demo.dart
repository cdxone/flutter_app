import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

const CITY_NAMES = {
  '北京':['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ExpansionTile例子'),
        ),
        body: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = [];
    CITY_NAMES.keys.map((key){
      list.add(_item(key,CITY_NAMES[key]));
    });
  }

  Widget _item(String key, List<String> city_names) {
//    const ExpansionTile({
//    Key key,
//    this.leading,//标题左侧要展示的widget
//    @required this.title,//要展示的标题widget
//    this.backgroundColor,//背景
//    this.onExpansionChanged,//列表展开收起的回调函数
//    this.children = const <Widget>[],//列表展开时显示的widget
//    this.trailing,//标题有侧要展示的widget
//    this.initiallyExpanded = false,//是否默认状态下展开
//    })
    return ExpansionTile(
      title: Text(key),
      trailing: Icon(Icons.arrow_upward),
      children: _buildETItem(city_names),
    );
  }

  List<Widget> _buildETItem(List<String> city_names) {
//    return city_names.map((String city){
//      return ;
//    }).toList();
  }
}
