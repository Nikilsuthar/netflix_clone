import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/Screen/splash.screen.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();


    _controller = VideoPlayerController.asset('assets/videos/trailer.webm')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      setState(() {});
    });
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration &&
          _controller.value.isInitialized) {
        // Switch to portrait mode
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        Navigator.pop(context); // Automatically pop the screen when video ends
      }
    });
    Future.delayed(const Duration(seconds: 3));
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    _controller.play();
    _isPlaying = true;

    _startHideControlsTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideControlsTimer?.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  void _toggleControlsVisibility() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls) {
        _startHideControlsTimer();
      }
    });
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? OrientationBuilder(builder: (context, orientation) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: _toggleControlsVisibility,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  if (_showControls)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        title: const Text(
                          "Stranger Things",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.5),
                        ),
                        leading: IconButton(
                            onPressed: () {
                              // Switch to portrait mode
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                              Navigator.pop(
                                  context); // Automatically pop the screen when video ends
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait)
                    Positioned(
                        top: 50,
                        right: 40,
                        child: iconNetflix(height * 0.15, width * 0.15)),
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape)
                    Positioned(
                        top: 50,
                        right: 40,
                        child: iconNetflix(width * 0.15, height * 0.15)),


                  if (_showControls)
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                              _isPlaying = false;
                            } else {
                              _controller.play();
                              _isPlaying = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black54,
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  if (_showControls)
                    Positioned(
                      bottom: 70,
                      right: 25,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (MediaQuery.of(context).orientation ==
                                Orientation.landscape) {
                              // Switch to portrait mode
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                            } else {
                              // Switch to landscape mode
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight,
                              ]);
                            }
                          });
                        },
                        icon: Icon(
                          MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? Icons.crop_portrait_outlined
                              : Icons.crop_landscape_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  if (_showControls)
                    Positioned(
                      bottom: 20,
                      left: 10,
                      right: 10,
                      child: Column(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.red,
                              inactiveTrackColor: Colors.grey,
                              thumbColor: Colors.red,
                              overlayColor: Colors.red.withOpacity(0.2),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              trackHeight: 3.0,
                            ),
                            child: Slider(
                              value: _controller.value.position.inMilliseconds
                                  .toDouble(),
                              min: 0,
                              max: _controller.value.duration.inMilliseconds
                                  .toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  _controller.seekTo(
                                      Duration(milliseconds: value.toInt()));
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatDuration(_controller.value.position),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  _formatDuration(_controller.value.duration),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            })
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            )),
    );
  }

  String _formatDuration(Duration position) {
    final minutes = position.inMinutes.toString().padLeft(2, '0');
    final seconds = (position.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
