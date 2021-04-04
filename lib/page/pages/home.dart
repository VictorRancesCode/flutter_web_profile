import 'package:flutter/material.dart';
import 'package:flutter_web_profile/components/cardPageAnimated.dart';
import 'package:flutter_web_profile/utils/responsive.dart';

class TabHome extends StatefulWidget {
  TabHome({this.widthX});

  final double widthX;

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return CardPageAnimated(
      widthX: widget.widthX,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text("Home", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.green)),
        ),
      ),
    );
  }
}
