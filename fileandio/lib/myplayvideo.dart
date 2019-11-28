import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyPlayVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPlayVideoState();
  }
}

class MyPlayVideoState extends State<MyPlayVideo> {
  VideoPlayerController _controller;
  Future<void> _initVideoPlayFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _initVideoPlayFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PlayVideo'),
        ),
        body: FutureBuilder(
          future: _initVideoPlayFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(
                child: VideoPlayer(_controller),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if(_controller.value.isPlaying)
              {
                _controller.pause();
              }else
              {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause:Icons.play_arrow
          ),
        ),    
    );
  }
}
