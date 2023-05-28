import 'package:flutter/material.dart';
import 'package:yt_shorts/models/video_model.dart';
import 'package:yt_shorts/services/api_service.dart';

class VideoState with ChangeNotifier {
  List<Posts> _posts = [];
  List<Posts> get postsgetter => [..._posts];
  
  // functio to API 
  Future<VideoModel> fetchdata(bool? isrefresh) async {
    VideoModel videodata = VideoModel();
    if (isrefresh == null) {
      videodata = await ApiService.getVideos();
      _posts.addAll(videodata.data!.posts!);
      notifyListeners();
    }
    if (isrefresh != null) {
      // increments pagination and adds data to list.
      ApiService.pageIncrement();
      videodata = await ApiService.getVideos();
      _posts.addAll(videodata.data!.posts!);
      notifyListeners();
    }
    // print(_posts.length);
    return videodata;
  }
}
