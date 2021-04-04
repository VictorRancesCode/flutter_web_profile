import 'package:flutter/material.dart';
import 'package:flutter_web_profile/utils/global.dart';

class ButtonMenu extends StatefulWidget {
  ButtonMenu(
      {Key key,
      this.icon,
      @required this.text,
      this.selected = false,
      this.onClik,
      this.durationAnimation})
      : super(key: key);
  final IconData icon;
  final String text;
  final bool selected;
  final Function onClik;
  final int durationAnimation;

  @override
  _ButtonMenuState createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {
  bool show = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: widget.durationAnimation),
      () => setState(
        () {
          show = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 1000),
      child: show
          ? InkWell(
              onTap: widget.onClik,
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.only(left: 20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: widget.selected
                        ? Global.colorSecond
                        : Global.colorPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (widget.icon != null)
                        Icon(widget.icon,
                            color: widget.selected
                                ? Global.colorPrimary
                                : Global.colorSecond),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.text,
                          style: TextStyle(
                              color: widget.selected
                                  ? Global.colorPrimary
                                  : Global.colorSecond),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
