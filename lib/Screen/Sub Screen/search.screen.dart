import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/Screen/Widgets/listandmap.dart';
import 'package:netflix_clone/Screen/splash.screen.dart';

import '../infopage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final ListAndMap mpp = ListAndMap();

  List<String> _filteredImages = []; // Initialize to avoid null checks
  String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    Map<String, List<String>> mymap = mpp.categorizedImages(context);



    void _onSearchChanged(String query) {
      setState(() {
        _searchQuery = query.trim().toLowerCase();
        if (_searchQuery.isEmpty) {
          _filteredImages = [];
        } else {
          // Filter keys that contain the search query
          final matchingKeys = mymap.keys
              .where((key) => key.toLowerCase().contains(_searchQuery))
              .toList();

          // Collect all values corresponding to the matching keys
          _filteredImages = matchingKeys
              .expand((key) => mymap[key]!)
              .toList(); // Flatten the list of lists
        }
      });
    }


    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04, top:  height * 0.05, bottom: height * 0.001),
               child: TextFormField(
                 keyboardAppearance: Brightness.dark,
                controller: _searchController,
                autofocus: true,
                 style: const TextStyle(
                   color: Colors.white, // Text input color
                 ),
                   cursorColor: Colors.white.withOpacity(0.3),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white38),
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
                onChanged: _onSearchChanged,
              ),

            ),
            Expanded(
              child: _filteredImages.isNotEmpty
                  ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 8,
                ),
                // padding: const EdgeInsets.all(11),
                itemCount: _filteredImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () async {
                        // Smoothly dismiss the keyboard
                        FocusScope.of(context).unfocus();

                        // Wait for the keyboard to fully dismiss
                        await Future.delayed(const Duration(milliseconds: 200));
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Infopage(
                              selectedImage: _filteredImages[index].toString(),
                            ),
                            // transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            //   return FadeTransition(opacity: animation, child: child);
                            // },
                          ),
                        );

                      },



                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            _filteredImages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ));
                },
              )
                  : Center(
                child:Opacity(opacity: 0.65
                ,child: iconNetflix(height, width),)
              ),
            ),
          ],
        ));
  }
}
