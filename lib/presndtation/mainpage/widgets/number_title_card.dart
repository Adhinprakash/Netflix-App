import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/number_card.dart';

import 'maintitle.dart';

class NumberTitlecard extends StatelessWidget {
  const NumberTitlecard({
    super.key, required this.categoryList,
  });
   final List<Movies>categoryList;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 Tv Shows In India Today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(categoryList.length, (index) => NumberCard(image:categoryList[index].posterPath!,index: index,)),
          ),
        )
      ],
    );
  }
}
