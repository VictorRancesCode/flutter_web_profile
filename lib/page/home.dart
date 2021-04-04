import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_profile/components/buttonChat.dart';
import 'package:flutter_web_profile/components/buttonMenu.dart';
import 'package:flutter_web_profile/components/buttonfloatingdialog.dart';
import 'package:flutter_web_profile/page/pages/about.dart';
import 'package:flutter_web_profile/page/pages/contact.dart';
import 'package:flutter_web_profile/page/pages/home.dart';
import 'package:flutter_web_profile/page/pages/projects.dart';
import 'package:flutter_web_profile/page/pages/skills.dart';
import 'package:flutter_web_profile/page/pages/works.dart';
import 'package:flutter_web_profile/utils/responsive.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int page = 0;
  bool show = false;
  dynamic data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
    Future.delayed(
      const Duration(microseconds: 20),
      () => setState(
        () {
          show = true;
        },
      ),
    );
  }

  loadJson() async {
    String response = await rootBundle.loadString('page.json');
    dynamic jsonResult = json.decode(response);
    setState(() {
      data = jsonResult;
    });
  }

  List<Widget> pages = [TabHome()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            if (isMobile(context) == false)
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                width: show ? size.width / 6 : 0.0,
                height: size.height,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // radius: 50.0,
                            //backgroundColor: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                    'https://codigopanda.nyc3.digitaloceanspaces.com/images/placehodler.jpg')),
                          ),
                        ),
                      ),
                      ButtonMenu(
                        durationAnimation: 1,
                        icon: Icons.home,
                        text: "Home",
                        selected: page == 0,
                        onClik: () {
                          setState(() {
                            page = 0;
                          });
                        },
                      ),
                      ButtonMenu(
                        durationAnimation: 1,
                        text: "About",
                        icon: Icons.person_outline,
                        selected: page == 1,
                        onClik: () {
                          setState(() {
                            page = 1;
                          });
                        },
                      ),
                      ButtonMenu(
                        durationAnimation: 1,
                        text: "Skills",
                        icon: Icons.star_border,
                        selected: page == 2,
                        onClik: () {
                          setState(() {
                            page = 2;
                          });
                        },
                      ),
                      ButtonMenu(
                        durationAnimation: 1,
                        text: "Works",
                        icon: Icons.work_outline,
                        selected: page == 3,
                        onClik: () {
                          setState(() {
                            page = 3;
                          });
                        },
                      ),
                      ButtonMenu(
                        durationAnimation: 1,
                        text: "Projects",
                        icon: Icons.list_alt_outlined,
                        selected: page == 4,
                        onClik: () {
                          setState(() {
                            page = 4;
                          });
                        },
                      ),
                      ButtonMenu(
                        durationAnimation: 1,
                        text: "Contact",
                        icon: Icons.contact_mail_outlined,
                        selected: page == 5,
                        onClik: () {
                          setState(() {
                            page = 5;
                          });
                        },
                      ),
                      // ButtonMenu(
                      //   durationAnimation: 1,
                      //   text: "Portofolio",
                      //   selected: page == 4,
                      //   onClik: () {
                      //     setState(() {
                      //       page = 4;
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            Flexible(child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (page == 0) {
                  return new TabHome(widthX: constraints.maxWidth);
                }
                if (page == 1) {
                  return new TabAbout(widthX: constraints.maxWidth);
                }
                if (page == 2) {
                  return new TabSkill(widthX: constraints.maxWidth);
                }
                if (page == 3) {
                  return new TabWork(widthX: constraints.maxWidth);
                }
                if (page == 4) {
                  return new TabProject(
                      widthX: constraints.maxWidth, data: data['page_projects']);
                }
                if (page == 5) {
                  return new TabContact(
                      widthX: constraints.maxWidth);
                }
              },
            ))
          ],
        ),
      ),
      floatingActionButton: ButtonChat(),
    );
  }
}
