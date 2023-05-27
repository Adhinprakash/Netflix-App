
import 'package:flutter/material.dart';
import 'package:netflixapp/presndtation/Home/home_functions/functions.dart';
import 'package:netflixapp/presndtation/mainpage/screen_main.dart';





class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splash(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDmmMZIyhtPhFrPgNJluXUJYJXROSX8Ua67A&usqp=CAU'),
      )),
    );
  }
  

  Future<void>splash(context)async{


await Functions.gettrending();
await Functions.getnowplaying();
await Functions.getupcoming();
await Functions.gettoprated();
await Functions.getdiscover();
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>ScreenMainpage() ));

  }




}