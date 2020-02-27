import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldTabBarDemo2 extends StatefulWidget {
  @override
  _ScaffoldTabBarDemo2State createState() => _ScaffoldTabBarDemo2State();
}

class _ScaffoldTabBarDemo2State extends State<ScaffoldTabBarDemo2> {
  String title = 'Scafford+TabBar实现切换Tab效果';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      // 可以采用DefaultTabController来包裹Scaffold
      home: DefaultTabController(length: choices.length, child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice){
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
                );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: choices.map((Choice choice){
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: ChoiceCard(choice),
            );
          }).toList(),
        ),
      )),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice(this.title, this.icon);
}

const List<Choice> choices = const <Choice>[
  const Choice('汽车', Icons.directions_car),
  const Choice('自行车', Icons.directions_bike),
  const Choice('船', Icons.directions_boat),
  const Choice('公共汽车', Icons.directions_bus),
  const Choice('走路', Icons.directions_walk),
];


class ChoiceCard extends StatelessWidget{
  final Choice choice;
  ChoiceCard(this.choice);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(choice.icon),
          Text(choice.title)
        ],
      ),
    );
  }
}