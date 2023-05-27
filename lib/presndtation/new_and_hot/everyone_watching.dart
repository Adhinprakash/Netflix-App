import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/custome_button.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/video_widget.dart';

class EveryOneseWatching extends StatelessWidget {
  const EveryOneseWatching({
    super.key,
    required this.index, required this.movies,
  });
  final int index;
  final Movies movies;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            movies.title??"unknown",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
         SizedBox(
            width: double.infinity,
            height: 150,
            child: Text(
                movies.overview!,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          kheight20,
           VideoWidget(images: movies.backdropPath!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomButtonWidget(
                  icon: Icons.share,
                  title: 'Share',
                  textSize: 10,
                  iconSize: 27,
                ),
                kwidth,
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  textSize: 10,
                  iconSize: 29,
                ),
                kwidth,
                CustomButtonWidget(
                  icon: Icons.play_arrow,
                  title: 'Play',
                  textSize: 10,
                  iconSize: 29,
                ),
                kwidth
              ],
            ),
          )
        ],
      ),
    );
  }
}
