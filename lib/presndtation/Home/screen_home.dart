import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/Home/widgets/background_card.dart';
import 'package:netflixapp/presndtation/Home/widgets/custome_button_widget.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/main_title_and_card.dart';
import 'package:netflixapp/presndtation/mainpage/widgets/number_title_card.dart';
ValueNotifier<bool>scrollNotifier=ValueNotifier(true);
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
         builder:(BuildContext context,index,_){
      
        return NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction=notification.direction;
          print(direction);
          if(direction==ScrollDirection.reverse){
            scrollNotifier.value=false;
          }else if(direction==ScrollDirection.forward){
            scrollNotifier.value=true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children:  [
              const  BackgroundCard(),
               MainTitleAndCard(title: "Released in the past year", categoryList:Functions.trendingNow),
                MainTitleAndCard(
                  title: "Trending now", categoryList:Functions.nowplaying ,
                ),
                NumberTitlecard(categoryList: Functions.discover),
                MainTitleAndCard(
                  title: "Tense dramas", categoryList: Functions.comingsoon,
                ),
                MainTitleAndCard(
                  title: "South indian cinemas", categoryList:Functions.toprated,
                )
              ],
            ),
          scrollNotifier.value==true 
          ?  AnimatedContainer(
            duration: const Duration(microseconds: 1000),
              width: double.infinity,
              height: 85,
              color: Colors.black.withOpacity(0.3),
child:  Column(
  children: [
    Row(
     children: [
   Image.asset("assets/pngegg.png",width: 60,height: 60,),
  const Spacer(),
    const Icon(
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
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Tv Shows",style:kHomeTitleText,),
         Text("Movies,",style: kHomeTitleText,), 
          Text("Categories",style: kHomeTitleText,),
      ],
    )
  ],
),


            ):kheight
          ],
        ),
      );
      } )
    );
  }

}
