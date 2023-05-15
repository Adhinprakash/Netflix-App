import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';


 ValueNotifier<int>  indexchangenotifier=ValueNotifier(0);
class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangenotifier,
       builder: (context, int newindex, _) {
      return BottomNavigationBar(
      currentIndex: newindex,
      elevation: 0,
     onTap: (newindex) {
       indexchangenotifier.value=newindex;
     },
      
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: backgroundcolor,
       selectedIconTheme: const IconThemeData(
        color: Colors.white
       ),
       unselectedIconTheme: const IconThemeData(
        color: Colors.grey
       ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'New & Hot'),
              BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: 'Fast laugh'),  BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'),  BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads'),
      ]);
    },);
  }
}