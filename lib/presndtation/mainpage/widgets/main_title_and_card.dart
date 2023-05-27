import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/maincard.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/maintitle.dart';

class MainTitleAndCard extends StatelessWidget {
  const MainTitleAndCard({super.key, required this.title, required this.categoryList});
  final String title;
 final List<Movies>categoryList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(categoryList.length, (index) =>  Maincard(image:categoryList[index].posterPath??'',)),
          ),
        )
      ],
    );
  }
}
