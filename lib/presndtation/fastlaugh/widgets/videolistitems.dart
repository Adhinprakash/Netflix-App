import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListItems extends StatefulWidget {
  const VideoListItems({super.key, required this.index});
  final int index;

  @override
  State<VideoListItems> createState() => _VideoListItemsState();
}

class _VideoListItemsState extends State<VideoListItems> {
  List<String> videos = [
        "assets/instagram_1664984813655.mp4"
        "assets/instagram__1656043918923.mp4"
        "assets/Tommy_Shelby_-_My_hand_has_blood_-_Peaky_Blinders(1080p).mp4"
        "assets/ضيفني_مابتندم.mp4"
        "assets/what_sense_is_our_society_male-dominated_-_Jordan_Peterson(720p).mp4"
  ];


  late VideoPlayerController _videoController;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(videos[widget.index])
      ..initialize().then((_) {
        setState(() {});
        
      });
      _videoController.play();
  }

@override
  void dispose() {
     _videoController.dispose();
    super.dispose();
   

  }

  @override
  Widget build(BuildContext) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,

          child: VideoPlayer(_videoController),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // left side
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 27,
                  child: IconButton(
                      onPressed: () {

                             setState(() {
                        if (_isVideoPlaying) {
                          _videoController.pause();
                          _isVideoPlaying = false;
                        } else {
                          _videoController.play();
                          _isVideoPlaying = true;
                        }
                      });
                      },
                      icon: Icon(
                        _isVideoPlaying? Icons.pause :Icons.play_arrow,
                        color: Colors.white,
                      )),
                ),

                // rightside
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w220_and_h330_face/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg"),
                      ),
                    ),
                    VideoActionWidget(icon: Icons.emoji_emotions, title: "LOL"),
                    VideoActionWidget(icon: Icons.add, title: "My List"),
                    VideoActionWidget(icon: Icons.share, title: "Share"),
                    VideoActionWidget(icon: Icons.play_arrow, title: "Play")
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
