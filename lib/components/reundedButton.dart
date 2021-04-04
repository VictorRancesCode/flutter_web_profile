import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;
  Color textColor;
  Color borderColor;
  bool showSaving;
  IconData icon;

  RoundedButton(
      {this.buttonName,
        this.onTap,
        this.height,
        this.showSaving=false,
        this.bottomMargin=0.0,
        this.borderWidth,
        this.width,
        this.buttonColor,
        this.textColor,
        this.icon,
        this.borderColor=const Color.fromRGBO(221, 221, 221, 1.0)});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: textColor, fontSize: 16.0, fontWeight: FontWeight.bold);
    if (borderWidth != 0.0)
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: height,
          margin: new EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15.0),
            border: new Border.all(
                color: borderColor,
                width: borderWidth),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(icon!=null)
                Container(
                  margin:new EdgeInsets.only(right: 5),
                  child: Icon(icon,color: textColor,),
                ),
              new Text(buttonName, style: textStyle)
            ],
          ),
        ),
      ));
    else
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: height,
          margin: new EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: buttonColor,
            borderRadius: new BorderRadius.all(const Radius.circular(15.0)),
          ),
          child: showSaving==true?new CircularProgressIndicator(backgroundColor: Colors.white,): Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(icon!=null)
                Icon(icon,color: textColor,),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: new Text(buttonName, style: textStyle),
              )
            ],
          ),
        ),
      ));
  }
}
