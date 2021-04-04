import 'package:flutter/material.dart';
import 'package:flutter_web_profile/components/cardPageAnimated.dart';

class TabAbout extends StatefulWidget {
  TabAbout({this.widthX});

  final double widthX;

  @override
  _TabAbout createState() => _TabAbout();
}

class _TabAbout extends State<TabAbout> {
  @override
  Widget build(BuildContext context) {
    return CardPageAnimated(
      widthX: widget.widthX,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text("About", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.green)),
        ),
      ),
    );
  }
}
