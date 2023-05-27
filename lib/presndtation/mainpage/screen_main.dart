import 'package:flutter/material.dart';
import 'package:netflixapp/presndtation/Home/screen_home.dart';
import 'package:netflixapp/presndtation/downloads/screen_download.dart';
import 'package:netflixapp/presndtation/fastlaugh/screen_fast_laugh.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/screen_bottomnav.dart';
import 'package:netflixapp/presndtation/new_and_hot/screen_new_hot.dart';
import 'package:netflixapp/presndtation/search/screen_search.dart';

class ScreenMainpage extends StatelessWidget {
  ScreenMainpage({super.key});

  final pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangenotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
