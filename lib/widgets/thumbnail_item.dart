import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/video_provider.dart';

class VideoThumbnail extends StatefulWidget {
  VideoThumbnail({
    Key? key,
    required this.post_id,
  }) : super(key: key);
  final String post_id;

  // NamedRoute
  static const routeName = '/full-video-screen';

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  bool play = false;

  @override
  Widget build(BuildContext context) {
    final videostate = Provider.of<VideoState>(context, listen: false);
    final currentpost = videostate.postsgetter.firstWhere((post) => post.postId == widget.post_id);
    return Container(
        child: Image.network(
      currentpost.submission!.thumbnail!,
      fit: BoxFit.fill,
    ));
  }
}
