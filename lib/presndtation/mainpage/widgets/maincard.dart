import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';

class Maincard extends StatelessWidget {
  const Maincard({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 200,
      width: 150,
      //  color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image:  DecorationImage(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500$image")),
      ),
    );
  }
}
