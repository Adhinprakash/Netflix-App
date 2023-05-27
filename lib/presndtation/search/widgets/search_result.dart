import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:netflixapp/presndtation/search/functions/function.dart';
import 'package:netflixapp/presndtation/search/widgets/searchtitles.dart';

final ImageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTexttitle(searchtitle: "Movies & Shows"),
        kheight,
      ValueListenableBuilder(valueListenable: SearchFunction.searchData, builder:  (context, value, child) {
        return  
 Expanded(
            child: GridView.count(
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 1 / 1.4,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(value.length, (index) {
                  return  MainMovieCards(images: value[index].posterPath?? ImageUrl ,);
                },),),);
      },)
      ],
    );
  }
}

class MainMovieCards extends StatelessWidget {
  const MainMovieCards({super.key, required this.images});
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500$images"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}





