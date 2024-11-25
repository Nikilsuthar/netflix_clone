import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/Screen/Widgets/listandmap.dart';
import 'package:netflix_clone/Screen/infopage.dart';

import '../Widgets/categery.dart';
import '../Widgets/home.screen.pageview.dart';
import '../Widgets/iconbutton.widget.dart';
import '../splash.screen.dart';
import '../trailer.video.screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  final ListAndMap _list=ListAndMap();

  final List<String> Hed =[
    'New Releases',
    'Horror',
    'Adventure',
    'Action',
    'Thriller',
    'Entertainment',

  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;


    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: height * 0.60,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const HomeScreenPageView(),
                  Positioned(
                    bottom: 5,
                    child: SizedBox(
                      width: width,
                      height: height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconTextColumn(
                            icon: Icons.add,
                            text: "My List",
                            onTap: () {
                              print("My List tapped");
                            },
                            iconSize: width * 0.07,
                            textSize: width * 0.03,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 7),
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                ]
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
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(),));
                              },
                            ),
                          ),
                          IconTextColumn(
                            icon: Icons.info_outline_rounded,
                            text: "Info",
                            onTap: () {
                              // String imageToDisplay = images[index].isNotEmpty ? images[index] : 'assets/images/Np1(n).jpg';
                              String imageToDisplay = _list.new1(context)[0];
                              Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                  Infopage(selectedImage: imageToDisplay),));
                            },
                            iconSize: width * 0.07,
                            textSize: width * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              SizedBox(
                height: height * 0.1,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconNetflix(height * 0.15, width * 0.15),
                    SizedBox(
                      width: width * 0.8,
                      child: TextFormField(
                        cursorColor: Colors.white.withOpacity(0.3),
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.white38),
                          hintText: "Search",
                          hintStyle: const TextStyle(color: Colors.white38),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.5),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(

              width: width,

              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategorySection(
                    title: "New Releases",
                    images: _list.new1(context),
                  ),
                  CategorySection(
                    title: "Horror",
                    images: _list.hor1(context),
                  ),
                  CategorySection(
                    title: "Adventure",
                    images: _list.Ad1(context),
                  ),
                  CategorySection(
                    title: "Action",
                    images: _list.Ak1(context),
                  ),
                  CategorySection(
                    title: "Thriller",
                    images: _list.Thi1(context),
                  ),
                  CategorySection(
                    title: "Entertainment",
                    images: _list.Co1(context),
                  ),




                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
