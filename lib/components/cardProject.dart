import 'package:flutter/material.dart';

class CardProject extends StatefulWidget {

  CardProject({this.item});
  final Map item;
  @override
  _CardProjectState createState() => _CardProjectState();
}

class _CardProjectState extends State<CardProject> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.item['image']),
                      fit: BoxFit.contain),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                widget.item['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                overflow: TextOverflow.ellipsis),
                            Text("Created: ${widget.item['date_created']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Colors.black12)),
                            Text(
                                widget.item['description'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    color: Colors.black45),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(widget.item.containsKey("web")==true)
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 30, height: 30),
                              child: ElevatedButton(
                                child: Image.network(
                                  "http://cdn.onlinewebfonts.com/svg/img_488156.png",
                                  height: 20,
                                  width: 20,
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.white, // background
                                    onPrimary: Colors.white,
                                    padding: EdgeInsets.all(15) // foreground
                                    ),
                              ),
                            ),
                            //Spacer(),
                            if(widget.item.containsKey("github")==true)
                            SizedBox(width: 10),
                            if(widget.item.containsKey("github")==true)
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 30, height: 30),
                              child: ElevatedButton(
                                child: Image.network(
                                  "https://image.flaticon.com/icons/png/512/25/25231.png",
                                  height: 20,
                                  width: 20,
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.white, // background
                                    onPrimary: Colors.white,
                                    padding: EdgeInsets.all(10) // foreground
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
