import 'package:flutter/material.dart';
import 'package:yt_shorts/provider/video_provider.dart';
import 'pages/full_video_scree.dart';
import 'pages/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => VideoState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yt Shorts',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.amber,
        ),
        home: HomeScreen(),
        routes: {
          FullScreen.routeName: (context) => FullScreen(),
        },
      ),
    );
  }
}
