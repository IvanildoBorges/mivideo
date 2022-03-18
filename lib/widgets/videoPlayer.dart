import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final bool looping;

  VideoPlayerWidget({
    required this.controller,
    required this.looping,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VideoPlayerWidgetState();
  }
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  void initializePlayer() {
    _chewieController = ChewieController(
      videoPlayerController: widget.controller,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage, style: TextStyle(color: Colors.white),),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        color: Colors.deepOrangeAccent,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }
}