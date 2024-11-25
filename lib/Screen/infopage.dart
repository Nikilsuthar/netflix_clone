import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Screen/trailer.video.screen.dart';

import 'Widgets/categery.dart';
import 'Widgets/iconbutton.widget.dart';

// void main() {
//   runApp(Infopage());
// }

class Infopage extends StatefulWidget {
  final String selectedImage;

  const Infopage({required this.selectedImage, super.key});

  @override
  State<Infopage> createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {
  late List<String> all1;
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = widget.selectedImage;

    all1 = [
      'assets/images/Np1(n).jpg',
      'assets/images/Np2(n2).webp',
      'assets/images/Np6(n).jpg',
      'assets/images/Np13(n).jpg',
      'assets/images/Np14(n).jpeg',
      'assets/images/Np7.jpg',
      'assets/images/Np39(ne).jpg',
      'assets/images/Np15(h).jpg',
      'assets/images/Np16(h).jpg',
      'assets/images/Np17(h).jpg',
      'assets/images/Np18(h).jpg',
      'assets/images/Np24(h).png',
      'assets/images/Np12.png',
      'assets/images/Np44(h).jpg',
      'assets/images/Np5(Ak).jpg',
      'assets/images/Np11(Ak).jpg',
      'assets/images/Np3(Ak).jpg',
      'assets/images/Np27(Ak).jpg',
      'assets/images/Np28(Ak).jpg',
      'assets/images/Np40(Ak).jpg',
      'assets/images/Np42(Ak).jpg',
      'assets/images/Np47(Ak).jpg',
      'assets/images/Np23(Thi).jpg',
      'assets/images/Np26(Thi).jpg',
      'assets/images/Np29(Thi).jpg',
      'assets/images/Np30(Thi).jpg',
      'assets/images/Np31(Thi).jpg',
      'assets/images/Np32(Thi).jpg',
      'assets/images/Np36(Thi).jpg',
      'assets/images/Np37(Thi).jpg',
      'assets/images/Np41(Thi).jpg',
      'assets/images/Np48(Thi).jpg',
      'assets/images/Np49(Thi).jpg',
      'assets/images/Np19(Ad).jpg',
      'assets/images/Np20(ad).jpg',
      'assets/images/Np21(Ad).jpg',
      'assets/images/Np14.jpeg',
      'assets/images/Np38(Ad).jpg',
      'assets/images/Np43(Ad).jpg',
      'assets/images/Np50(Ad).jpg',
      'assets/images/Np33(Co).jpg',
      'assets/images/Np34(Co).jpg',
      'assets/images/Np35(Co).jpg',
      'assets/images/Np33(Co).jpg',
      'assets/images/Np45(Co).jpg',
      'assets/images/Np46(Co).jpg',
    ];

    all1.remove(selectedImage);
  }
  bool fav=false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    // double _columnOffset = 0.0; // Initial offset for the column
    // bool _blurBackground = false; // Blur effect toggle

    return  Scaffold(
      resizeToAvoidBottomInset: false,
          body: Container(
            width: width,
            height: height,
            color: Colors.black,
            child:
                SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                SizedBox(
                  height: height * 0.05,
                                ),
                    Stack(
                  children: [
                    SizedBox(
                      height: height * 0.33,
                      width: width,
                      child: Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          selectedImage,
                          fit: BoxFit.fitWidth,
                          width: selectedImage == "assets/images/Np5(Ak).jpg"
                              ? width
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: height * 0.33,
                        width: width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    selectedImage,
                                    fit: BoxFit.fill,
                                    width:
                                        selectedImage == "assets/images/Np5(Ak).jpg"
                                            ? width
                                            : null,
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     gradient: LinearGradient(
                                  //       colors: [
                                  //         Colors.black.withOpacity(0.5),
                                  //         Colors.transparent,
                                  //       ],
                                  //       begin: Alignment.bottomCenter,
                                  //       end: Alignment.topCenter,
                                  //     ),
                                  //   ),
                                  // ),
                                ]))),
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:(Icon(Icons.arrow_back)),color: Colors.white,)
                  ],
                                ),
                                SizedBox(
                  height: height * 0.02,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (fav) {
                          fav = false;
                        } else {
                          fav = true;
                        }
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: width * 0.07,
                          color: fav ? Colors.red : Colors.white,
                        ),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                       ),
                    child: InkWell(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          Text(
                            "Trailer",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(),
                            ));
                      },
                    ),
                  ),
                  IconTextColumn(
                    icon: Icons.add,
                    text: "My List",
                    onTap: () {
                      print("My List tapped");
                    },
                    iconSize: width * 0.07,
                    textSize: width * 0.03,
                  ),
                                ]),
                                SizedBox(
                  height: height * 0.001,
                                ),
                                Row(
                  children: [
                    SizedBox(
                      width: width * 0.025,
                    ),
                    Text(
                      'YOU',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width*0.11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                                ),
                                Row(
                  children: [
                    SizedBox(
                      width: width * 0.025,
                    ),
                    Text(
                      '2017-2024',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "18+",
                              style:
                                  TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      '4 SEASONS',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                                ),
                                SizedBox(
                  height: height * 0.0048,
                                ),
                                Row(
                  children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.yellow,
                    ),
                  ],
                                ),
                                SizedBox(
                  height: height * 0.01,
                                ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "In this psychological thriller, charming yet dangerously "
                            "obsessive Joe Goldberg will do anything to insert "
                            "himself into the lives of those he desires. "
                            "'You' explores the fine line between "
                            "passion and peril in chilling, edge-of-your-seat "
                            "storytelling.",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width *
                              0.035,
                          color: Colors.white70, // Text color
                        ),
                        softWrap: true, // Ensures text wraps to the next line
                        overflow:
                        TextOverflow.visible, // Ensures no text gets clipped
                      ),
                    ),
                                CategorySection(
                           title: "Top Rated",
                           images: all1,
                         )
                              ]),
                ),
          ),
        );
  }
}
