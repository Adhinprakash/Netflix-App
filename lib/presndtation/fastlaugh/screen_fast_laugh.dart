

import 'package:flutter/material.dart';
import 'package:netflixapp/presndtation/fastlaugh/widgets/videolistitems.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
            4,
            (index) => WidgetVideoList(
                  index: index,
                )),
      ),
    ));
  }
}