import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  String url;

  VideoPlayerScreen({Key key, this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  YoutubePlayerController _controller;

  @override
  void initState() {

    _controller = YoutubePlayerController(
      initialVideoId: widget.url,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        forceHD: true,
        forceHideAnnotation: true
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: YoutubePlayer(
          controller: _controller,
          progressIndicatorColor: Colors.white,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
