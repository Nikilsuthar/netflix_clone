import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenPageView extends StatefulWidget {
  const HomeScreenPageView({super.key});

  @override
  State<HomeScreenPageView> createState() => _HomeScreenPageViewState();
}

class _HomeScreenPageViewState extends State<HomeScreenPageView> {
  final List<String> ima = [
    'assets/images/Np9(2).jpg',
    'assets/images/Np12.png',
    'assets/images/Np10.jpg',
    'assets/images/Np15(h).jpg',
    'assets/images/Np8.jpg',
    'assets/images/Np7.jpg',
  ];

  late final PageController pageController;
  int currentpage = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Duplicate the first image at the end of the list for seamless looping
    ima.add(ima[0]);

    pageController = PageController(initialPage: 0);

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int nextPage = currentpage + 1;
      pageController.animateToPage(nextPage,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);

      if (nextPage == ima.length - 1) {
        Future.delayed(Duration(seconds: 1), () {
          pageController.jumpToPage(0);
        });
        currentpage = 0;
      } else {
        currentpage = nextPage;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: ima.length,
      onPageChanged: (index) {
        currentpage = index;
      },
      itemBuilder: (context, index) {
        return Image.asset(ima[index], fit: BoxFit.fill);
      },
    );
  }
}
