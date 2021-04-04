import 'package:flutter/material.dart';
import 'package:flutter_web_profile/components/cardPageAnimated.dart';

class TabWork extends StatefulWidget {
  TabWork({this.widthX});

  final double widthX;

  @override
  _TabWork createState() => _TabWork();
}

class _TabWork extends State<TabWork> {
  bool show = false;
  bool showItems = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 300),
          () => setState(
            () {
          show = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardPageAnimated(
      widthX: widget.widthX,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text("Works", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.green)),
        ),
      ),
    );
  }
}
