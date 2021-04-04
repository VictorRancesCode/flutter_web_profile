
import 'package:flutter/material.dart';
import 'package:flutter_web_profile/page/home.dart';
import 'package:flutter_web_profile/page/intro.dart';
import 'package:just_audio/just_audio.dart';
import 'components/buttonfloatingdialog.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'effect/shatter.dart';

GlobalKey<ShatterSceneState> globalKey = GlobalKey();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool page2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          if (page2 == true)
            Positioned(
              child: PageHome(),
              // child: SingleChildScrollView(
              //   child: Container(
              //     decoration: BoxDecoration(color: Colors.red),
              //     child: PageHome(),
              //   ),
              // ),
            ),
          Positioned(
            child: Container(
              child: ShatterScene(
                key: globalKey,
                child: PageIntro(
                  startAnimation: () async{

                    // Set the audio source but manually load audio at a later point.
                    await _audioPlayer.setFilePath('assets/good.mp3', preload: false);
                    // Acquire platform decoders and start loading audio.
                    var duration = await _audioPlayer.load();
                    _audioPlayer.play();

                    Future.delayed(
                      const Duration(microseconds: 5),
                          () =>  globalKey.currentState.recordImage(),
                    );

                    Future.delayed(
                      const Duration(microseconds: 20),
                      () => setState(
                        () {
                          page2 = true;
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    )
        //
        //   Container(
        //   child: ShatterScene(
        //   key: globalKey,
        //   child: PageIntro(startAnimation: (){ globalKey.currentState.recordImage();},),
        // ),
        // ),
        // floatingActionButton: new ButtonFloatingDialog(
        //   child: new Column(
        //     children: <Widget>[
        //       new Container(
        //         height: 30.0,
        //         child: Center(
        //           child: new Text(
        //             "Contactame",
        //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        //           ),
        //         ),
        //       ),
        //       // new Flexible(
        //       //     child: new ListView.builder(
        //       //       padding: new EdgeInsets.all(8.0),
        //       //       reverse: true,
        //       //       itemBuilder: (_, int index) => _messages[index],
        //       //       itemCount: _messages.length,
        //       //     )),
        //       new Divider(height: 1.0),
        //       new Container(
        //         decoration: new BoxDecoration(color: Theme.of(context).cardColor),
        //         // child: _buildTextComposer(),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
