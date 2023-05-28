import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:yt_shorts/widgets/videoitem.dart';
import '../provider/video_provider.dart';
import '../widgets/snackbar.dart';

// This is code when video is playing in full screen
class FullScreen extends StatelessWidget {
  const FullScreen({super.key});
  static const routeName = '/full-video-screen';
  @override
  Widget build(BuildContext context) {
    var currentindex = ModalRoute.of(context)!.settings.arguments as int;
    final viderstate = Provider.of<VideoState>(
      context,
    );
    return Scaffold(
      body: SafeArea(
        child: Swiper(
          //index which is passed from the previous screen(Thumbnail screen)
          index: currentindex,
          loop: false,
          scrollDirection: Axis.vertical,
          itemCount: viderstate.postsgetter.length,
          onIndexChanged: (index) async {
            // API get called when the user reaches the end of the video list
            if (index == viderstate.postsgetter.length - 1) {
              // print('full-video screen last index');
              await viderstate.fetchdata(true);
              showCustomSnackbar("Loading video\'s....", context);
            }
          },
          itemBuilder: (context, index) {
            // Here, we get index from index property of Swiper class
            return Stack(
              fit: StackFit.expand,
              children: [
                VIdeoItem(
                    url: viderstate.postsgetter[index].submission!.mediaUrl!,
                    sourceType: DataSourceType.network),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                viderstate.postsgetter[index].creator!.pic!),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(viderstate.postsgetter[index].creator!.handle!),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        viderstate.postsgetter[index].submission!.description!,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
