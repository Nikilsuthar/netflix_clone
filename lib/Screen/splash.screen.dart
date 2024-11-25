import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Screen/Authentication/signup.screen.dart';

import 'main.screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) { // Check if the widget is still in the tree
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => SignUpScreen()),
    //   );
    // });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: SizedBox(
                height: height * 0.25,
                width: width * 0.3,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientContainer(
                          height: height * 0.4,
                          width: (width * 0.3) * 0.3,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        GradientContainer(
                          height: height * 0.4,
                          width: (width * 0.3) * 0.3,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ],
                    ),
                    RotatedRect(
                      width: (width * 0.3) * 0.3,
                      height: height * 0.4,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RotatedRect extends StatelessWidget {
  RotatedRect({super.key, required this.width, required this.height});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: RotatedRectPainter(),
    );
  }
}

class RotatedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 224, 20, 6)
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-pi / 8.15);
    canvas.save();
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 1.1, size.height * 0.075),
        width: size.width,
        height: size.height + 2.5,
      ),
      paint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class GradientContainer extends StatelessWidget {
  final double height;
  final double width;
  final Alignment begin;
  final Alignment end;

  const GradientContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.begin,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: const [
            Color.fromARGB(255, 230, 15, 0),
            Color.fromARGB(255, 181, 28, 8),
            Color.fromARGB(255, 155, 26, 9),
            Color.fromARGB(255, 146, 27, 11),
          ],
        ),
      ),
    );
  }
}

SizedBox iconNetflix(double height, double width) {
  return SizedBox(
    height: height * 0.25,
    width: width * 0.3,
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GradientContainer(
              height: height * 0.4,
              width: (width * 0.3) * 0.3,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            GradientContainer(
              height: height * 0.4,
              width: (width * 0.3) * 0.3,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ],
        ),
        RotatedRect(
          width: (width * 0.3) * 0.3,
          height: height * 0.4,
        ),
      ],
    ),
  );
}
