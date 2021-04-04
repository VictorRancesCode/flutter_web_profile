import 'package:flutter/material.dart';
import 'package:flutter_web_profile/components/cardPageAnimated.dart';

class TabContact extends StatefulWidget {
  TabContact({this.widthX});

  final double widthX;

  @override
  _TabContact createState() => _TabContact();
}

class _TabContact extends State<TabContact> {
  @override
  Widget build(BuildContext context) {
    return CardPageAnimated(
      widthX: widget.widthX,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text("Contact", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.green)),
              Center(
                child: Image.asset('mega.gif'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
