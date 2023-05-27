import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/search/widgets/searchtitles.dart';

class SearchIdleWidget extends StatelessWidget {
   SearchIdleWidget({super.key});
  final List<Movies>movie=Functions.comingsoon+Functions.toprated
  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTexttitle(searchtitle: "Top Movies"),
          kheight,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>  TopSearchitemlists(movies: movie[index],),
                separatorBuilder: (context, index) => kheight20,
                itemCount: movie.length),
          )
        ],
      )),
    );
  }
}

class TopSearchitemlists extends StatelessWidget {
  const TopSearchitemlists({super.key, required this.movies});
  final Movies movies;

  final imageUrl =
      "https://www.themoviedb.org/t/p/w250_and_h141_face/ctZZvclXm1txxdnxpiIalWduNto.jpg";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 95,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://image.tmdb.org/t/p/w500${movies.posterPath}"), fit: BoxFit.cover),
          ),
        ),
        kwidth,
         Expanded(
          child: Text(
            movies.title?? "unknown",
            style:const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          radius: 30,
          backgroundColor: kwhitecolor,
          child: CircleAvatar(
            backgroundColor: kblackcolor,
            radius: 28,
            child: Icon(
              Icons.play_circle_filled_outlined,
              color: kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
