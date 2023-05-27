import 'package:flutter/material.dart';
import 'package:netflixapp/presndtation/fastlaugh/widgets/videolistitems.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(5, (index) {
          return VideoListItems(
            index: index,
          );
        }),
      )),
    );
  }
}
