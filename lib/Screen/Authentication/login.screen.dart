import 'package:flutter/material.dart';
import 'package:netflix_clone/Screen/Authentication/signup.screen.dart';

import '../main.screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "NETFLIX",
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.06),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              cursorColor: Colors.white24,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fillColor: Colors.white30,
                filled: true,
                label: Text(
                  "Email or phone number",
                  style: TextStyle(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            TextField(
              cursorColor: Colors.white24,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fillColor: Colors.white30,
                filled: true,
                label: Text(
                  "Password",
                  style: TextStyle(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
            SizedBox(
              height: height * 0.03,
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
                alignment: Alignment.center,
                height: height * 0.075,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.05),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "OR",
              style: TextStyle(color: Colors.white54, fontSize: width * 0.05),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: height * 0.065,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Use a sign-in code",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.04),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Forgot password?",
              style: TextStyle(color: Colors.white54, fontSize: width * 0.045),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "New to Netflix? Sign up now.?",
              style: TextStyle(color: Colors.white54, fontSize: width * 0.045),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Sign-in is protected by Google reCAPTCHA to ensure\nyou're not a bot.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white38, fontSize: width * 0.03),
            ),
          ],
        ),
      ),
    );
  }
}
