
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Screen/Authentication/sub.signup.screen.dart';

import '../main.screen.dart';
import '../splash.screen.dart';
import 'login.screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _controller = PageController();
  final SubSignUpScreen _subSignUpScreen = SubSignUpScreen();

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    void _showFullScreenSlider() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Makes it full-screen height
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;

          return Container(
            height: height * 0.9, // Adjust the height if needed
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the slider
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 25,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Ready to watch?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.09,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Enter your email to create or sign in to your account.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      fillColor: Colors.transparent,
                      filled: true,
                      label: Text(
                        "Email or phone number",
                        style: TextStyle(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MainScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    alignment: Alignment.center,
                    height: height * 0.06,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Stack(
          children: [
            Positioned(
                left: 20, child: iconNetflix(height * 0.18, width * 0.18)),
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "PRIVACY",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.035),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ));
            },
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.035),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.white,
            ),
            onSelected: (value) {
              switch (value) {
                case 'FAQs':
                  break;
                case 'HELP':
                  break;
              }
            },
            color: Colors.white,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'FAQs',
                  child: Text('FAQs'),
                ),
                const PopupMenuItem(
                  value: 'HELP',
                  child: Text('HELP'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _subSignUpScreen.buildTextScreen(width),
                    _subSignUpScreen.buildImageScreen(width, height),
                    VideoScreen(),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  left: (width - 72) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 8.0,
                        width: 8.0,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.red
                              : Colors.grey.shade600,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: _showFullScreenSlider,
            child: Container(
              margin: const EdgeInsets.all(12),
              alignment: Alignment.center,
              height: height * 0.05,
              width: width,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.045),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
