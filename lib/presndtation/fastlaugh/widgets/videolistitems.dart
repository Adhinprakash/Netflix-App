import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WidgetVideoList extends StatefulWidget {
  const WidgetVideoList({super.key, required this.index});
  final int index;

  @override
  State<WidgetVideoList> createState() => _WidgetVideoListState();
}

class _WidgetVideoListState extends State<WidgetVideoList> {
  List<String> video = [
   
    
    'assets/instagram__1656043918923.mp4',
    'assets/instagram_1664984813655.mp4',
    'assets/Tommy_Shelby_-_My_hand_has_blood_-_Peaky_Blinders(1080p).mp4',
    'assets/what_sense_is_our_society_male-dominated_-_Jordan_Peterson(720p).mp4',
   // 'assets/ضيفني_مابتندم.mp4',
    
  ];

  late VideoPlayerController _videoController;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(video[widget.index])
      ..initialize().then((_) {
        setState(() {});
      });
    _videoController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(_videoController),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        color: Colors.white,
                        size: 28,
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:   [
                 const   Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                         "https://www.themoviedb.org/t/p/w220_and_h330_face/qcNDxDzd5OW9wE3c8nWxCBQoBrM.jpg"
                        ),
                      ),
                    ),
                   const  VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                 const    VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
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
                            _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 28,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});
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
            size: 40,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}





