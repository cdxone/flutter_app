import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResDemo extends StatefulWidget {
  @override
  _ResDemoState createState() => _ResDemoState();
}

class _ResDemoState extends State<ResDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Image.asset(
          'images/test.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
