import 'package:flutter/material.dart';
import 'package:flutter_web_profile/components/cardPageAnimated.dart';
import 'package:flutter_web_profile/components/cardProject.dart';

class TabProject extends StatefulWidget {
  TabProject({this.widthX,this.data});

  final double widthX;
  final dynamic data;

  @override
  _TabProject createState() => _TabProject();
}

class _TabProject extends State<TabProject> {
  List<dynamic> listProjects;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listProjects=widget.data['projects'];
    //print(widget.data);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CardPageAnimated(
      widthX: widget.widthX,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text("Projects & Packages & Others", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.green)),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 10.0, // gap between adjacent chips
                runSpacing: 10.0, // gap between lines
                children: <Widget>[
                  for(var i=0;i<listProjects.length;i++)
                    CardProject(item:listProjects[i]),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
