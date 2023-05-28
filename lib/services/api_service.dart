import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yt_shorts/models/video_model.dart';

// API calling function to fetch data
class ApiService {
  static int _page = 0;
  static Future<VideoModel> getVideos() async {
    {
      var URL = Uri.parse(
          "https://internship-service.onrender.com/videos?page=$_page");
      var response = await http.get(URL);
      var jsondata = VideoModel.fromJson(jsonDecode(response.body));
      return jsondata;
    }
  }


  // API page increment function 
  static void pageIncrement() {
    if (!(_page > 10)) {
      _page++;
    }
    // print(_page);
  }
}
