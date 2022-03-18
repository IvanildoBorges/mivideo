import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../widgets/videoPlayer.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("Mi Video Player",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 20, right: 10, left: 10),
                  child: Text("Video local: Gunsliger - Avenged SevenFold",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                VideoPlayerWidget(
                  controller: VideoPlayerController.asset("videos/Gunslinger.mp4"),
                  looping: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 20, right: 10, left: 10),
                  child: Text("Video da internet: Abelha - GitHub Flutter",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                VideoPlayerWidget(
                  controller: VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
                  looping: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}