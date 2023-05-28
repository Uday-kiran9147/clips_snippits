import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VIdeoItem extends StatefulWidget {
  const VIdeoItem({
    Key? key,
    required this.url,
    required this.sourceType,
  }) : super(key: key);
  final String url;
  final DataSourceType sourceType;

  @override
  State<VIdeoItem> createState() => _VIdeoItemState();
}

class _VIdeoItemState extends State<VIdeoItem> {
  late VideoPlayerController _videoController;
  // late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    switch (widget.sourceType) {
      case DataSourceType.network:
        _videoController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.asset:
        _videoController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.file:
        _videoController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _videoController.initialize().then((_) {
      setState(() {
        _videoController = VideoPlayerController.network(widget.url)
          ..initialize().then((value) {
            setState(() {
              _videoController.play();
            });
          });
        // _chewieController = ChewieController(
        //   autoPlay: true,
        //     allowFullScreen: true,
        //     autoInitialize: true,
        //     // placeholder:Center(child: Image.asset('assets/images.png')) ,
        //     videoPlayerController: _videoController,
        //     aspectRatio: _videoController.value.aspectRatio);
      });
    });
  }

  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      onDoubleTap: () {
        Navigator.of(context).pop();
      },
      child: AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: _videoController.value.isInitialized
            ? VideoPlayer(_videoController)
            : Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
