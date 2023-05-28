import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yt_shorts/pages/full_video_scree.dart';
import '../provider/video_provider.dart';
import '../widgets/snackbar.dart';
import '../widgets/thumbnail_item.dart';


// Default home screen of the application 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final videostate = Provider.of<VideoState>(context, listen: false);
    videostate.fetchdata(null);
    // print('This is init state');
  }

  @override
  Widget build(BuildContext context) {
    final videostate = Provider.of<VideoState>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 10,
          elevation: 15,
          title: Text(
            "Short Clips",
            style: TextStyle(
                fontSize: 22,
                fontStyle: GoogleFonts.poppins().fontStyle,
                fontWeight: FontWeight.w300),
          )),
      body: Container(
        child: Swiper(
          curve: Curves.bounceOut,
          loop: false,
          onTap: (index) {
            Navigator.pushNamed(context, FullScreen.routeName,
                arguments: index);
          },
          itemCount: videostate.postsgetter.length,
          scrollDirection: Axis.vertical,
          onIndexChanged: (index) async {
            if (index == videostate.postsgetter.length - 1) {
              // print('This is last index');
              await videostate.fetchdata(true);
              showCustomSnackbar("Loading....", context);
              // print('Thumbnail fetched');
            }
          },
          itemBuilder: (context, index) {
            return VideoThumbnail(
              post_id: videostate.postsgetter[index].postId!,
            );
          },
        ),
      ),
    );
  }
}
