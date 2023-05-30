import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/custome_button.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/video_widget.dart';

class ComingsoonWidget extends StatelessWidget {
  const ComingsoonWidget({
    super.key, required this.movies,
  });

final Movies movies;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
final String apiDate = movies.releaseDate!;
    DateTime date = DateTime.parse(apiDate);
    final String releaseDate = DateFormat.MMMd().format(date);
    final String releaseDay = DateFormat.EEEE().format(date);
    return Row(
      children:  [
        SizedBox(
          height: 450,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(releaseDate,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
         
            ],
          ),
        ),
       SizedBox(
          width: size.width - 50,
          height: 460,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
             VideoWidget(images: movies.backdropPath!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   SizedBox(
                    width: 240,
                    height: 40,
                    child: Text(
                      movies.title!,
                      style:const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -3,
                      ),
                    ),
                  ),
               const   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      CustomButtonWidget(
                        icon: Icons.notifications_outlined,
                        title: 'Remind me',
                        textSize: 10,
                        iconSize: 20,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                    ],
                  )
                ],
              ),
              kheight,
               Text("Coming on $releaseDay"),
              kheight,
             SizedBox(
                height: 20,
                child: Text(
                  movies.title!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
               SizedBox(
                width: double.infinity,
                height: 140,
                child: Text(
                  movies.overview!,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
