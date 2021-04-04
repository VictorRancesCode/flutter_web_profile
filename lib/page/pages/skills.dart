import 'package:flutter/material.dart';
import 'package:flutter_web_profile/components/cardPageAnimated.dart';

class TabSkill extends StatefulWidget {
  TabSkill({this.widthX});

  final double widthX;

  @override
  _TabSkill createState() => _TabSkill();
}

class _TabSkill extends State<TabSkill> {
  @override
  Widget build(BuildContext context) {
    return CardPageAnimated(
      widthX: widget.widthX,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text("Skills", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.green)),
        ),
      ),
    );
  }
}
