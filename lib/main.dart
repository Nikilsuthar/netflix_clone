import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/Screen/Authentication/signup.screen.dart';

import 'Screen/splash.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
