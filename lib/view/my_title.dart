import 'package:flutter/cupertino.dart';

/**
 * 自定义的MyTitle，减少重复的代码
 */
class MyTitle extends StatefulWidget {
  String _titleName;

  @override
  _MyTitleState createState() => _MyTitleState(_titleName);

  MyTitle(this._titleName);
}

class _MyTitleState extends State<MyTitle> {

  String _titleName;

  _MyTitleState(this._titleName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 10),
      child: Text(_titleName,style: TextStyle(fontSize: 20),),
    );
  }
}
