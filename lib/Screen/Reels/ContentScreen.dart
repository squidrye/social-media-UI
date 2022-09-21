import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'OptionScreen.dart';
import 'likeIcon.dart';
import 'package:flick_video_player/flick_video_player.dart';

class ContentScreen extends StatefulWidget {
  final String src;

  const ContentScreen({Key? key, required this.src}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  FlickManager? flickManager;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      looping: true,
    );
    flickManager = FlickManager(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Container(
                  width: double.infinity,
                  child: FlickVideoPlayer(
                    flickManager: flickManager!,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen()
      ],
    );
  }
}
