import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixapp/api/api_uri.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/downloads/widgets/app_bar_widget.dart';
import 'package:netflixapp/presndtation/splash.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgets = [
    const SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: AppbarWidget(
                title: "Downloads",
              ),
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgets[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgets.length));
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: const [
        Icon(Icons.settings, color: kwhitecolor),
        kwidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List images = [
     Functions.comingsoon[0].posterPath, Functions.discover[0].posterPath, Functions.nowplaying[0].posterPath,
    ];
    return Column(
      children: [
        const Text(
          "Introduce Download for You",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We'll download a personalised selection of\n movie and shows for you,so there's\n always something to watch on your\n device ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.39,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImagesWidget(
                images: images[0],
                margin: const EdgeInsets.only(left: 160),
                angle: 20,
                size: Size(size.width * 0.35, size.width * 0.55),
                radius: 10,
              ),
              DownloadsImagesWidget(
                  images: images
                  [1],
                  margin: const EdgeInsets.only(right: 160),
                  angle: -20,
                  radius: 10,
                  size: Size(size.width * 0.35, size.width * 0.55)),
              DownloadsImagesWidget(
                images: images[2],
                margin: const EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.4, size.width * 0.65),
                radius: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttoncolorblue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set Up",
                style: TextStyle(
                    color: kwhitecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kbuttoncolorwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kblackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImagesWidget extends StatelessWidget {
  const DownloadsImagesWidget(
      {super.key,
      required this.images,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10});
  final double radius;
  final String images;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,

            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage("https://image.tmdb.org/t/p/w500$images"))),
          ),
        ),
      ),
    );
  }
}
