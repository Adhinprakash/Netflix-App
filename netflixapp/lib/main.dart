import 'package:flutter/material.dart';
import 'package:netflixapp/presndtation/mainpage/screen_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
           bodySmall: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)
            )
        ),
      home:  ScreenMainpage(),
    );
  }
}

