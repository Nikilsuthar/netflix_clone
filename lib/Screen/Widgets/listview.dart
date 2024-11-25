import 'package:flutter/material.dart';
import 'package:netflix_clone/Screen/infopage.dart';

class ImageListView extends StatelessWidget {
  //final String title;
  final List<String> images;

  //final Axis scrollDirection;

  const ImageListView({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenh = MediaQuery.of(context).size.height;
    var screenw = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: screenh * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length, // Number of items
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Infopage(
                              selectedImage: images[index].toString(),
                            ),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
