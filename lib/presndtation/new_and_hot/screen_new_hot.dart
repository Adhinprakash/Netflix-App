import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/custome_button.dart';
import 'package:netflixapp/presndtation/new_and_hot/comingsoon.dart';
import 'package:netflixapp/presndtation/new_and_hot/everyone_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: AppBar(
                  title: const Text(
                    "New & Hot",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  actions: [
                    Icon(
                      Icons.cast,
                      color: Colors.white,
                    ),
                    kwidth,
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                    ),
                    kwidth
                  ],
                  bottom: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: kwhitecolor,
                      labelColor: kblackcolor,
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                      indicator: BoxDecoration(
                          color: kwhitecolor, borderRadius: kradius30),
                      tabs: const [
                        Tab(
                          text: "🍿 Coming Soon",
                        ),
                        Tab(
                          text: "👀 Everyone's watching",
                        ),
                      ])),
            )),
        body: TabBarView(
            children: [_buildcomingsoon(), _buildEveryoneswatching()]),
      ),
    );
  }

  Widget _buildcomingsoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) =>   ComingsoonWidget(movies: Functions.comingsoon[index],),
    );
  }

  _buildEveryoneswatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => EveryOneseWatching(index: index, movies: Functions.trendingNow[index]),
    );
  }
}
