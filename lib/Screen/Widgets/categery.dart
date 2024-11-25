import 'package:flutter/material.dart';

import 'listview.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<String> images;

  const CategorySection({
    Key? key,
    required this.title,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenw = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), // Add spacing between sections
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: screenw * 0.055,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ImageListView(images: images,),
        ],
      ),
    );
  }
}
