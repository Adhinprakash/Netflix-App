import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key, required this.images,
  });
final  String images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://image.tmdb.org/t/p/w500$images",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 20,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
