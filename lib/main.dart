import 'package:flutter/material.dart';
import 'package:flutter_headless_cms/widgets/card.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_web/video_player_web.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/natureBg.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Scaffold WebView(BuildContext context) {
//   return Scaffold(
//      body: Stack(
//           children: <Widget>[
//             SizedBox.expand(
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: SizedBox(
//                   width: _controller.value.size?.width ?? 0,
//                   height: _controller.value.size?.height ?? 0,
//                   child: VideoPlayer(_controller),
//                 ),
//               ),
//             ),
          
//           ],
//         ),
//       );
// }

// Scaffold mobileView(BuildContext context) {
//   return Scaffold(
//       body: Container(
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: Text("hi"),
//         )
//       ],
//     ),
//   ));
// }
