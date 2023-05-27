import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.image});
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 150,
              width: 40,
            ),
            Container(
              height: 200,
              width: 150,
              //  color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: kradius10,
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500$image")),
              ),
            ),
          ],
        ),
        Positioned(
          left: 30,
          top: 90,
          child: BorderedText(
            strokeColor: kwhitecolor,
            strokeWidth: 10.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  color: kblackcolor,
                  fontSize: 109,
                  decoration: TextDecoration.none,
                  decorationColor: Color.fromARGB(255, 250, 244, 244)),
            ),
          ),
        )
      ],
    );
  }
}
