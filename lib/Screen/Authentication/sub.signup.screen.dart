import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SubSignUpScreen {
  Widget buildTextScreen(double width) {
    return Container(
      color: Colors.black,
      child: Center(
          child: Text(
        "NETFLIX",
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.13),
      )),
    );
  }

Widget buildImageScreen(double width, double height) {
  return Container(
    color: Colors.black,
    child: Stack(
      children: [
        // Background Image with Opacity
        Positioned.fill(
          child: Opacity(
            opacity: 0.25, // Adjust the opacity level as needed
            child: Image.asset(
              "assets/images/SUI1.jpeg",
              fit: BoxFit.cover, // Ensures the image covers the whole screen
            ),
          ),
        ),
        // Centered Text
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Text(
                  "Unlimited entertainment, one low price",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.08,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Text(
                  "Everything on Netflix, starting at just ₹149.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/signup.webm")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(
                color: Colors.red,
              ), // Show loader until the video is ready
      ),
    );
  }
}
