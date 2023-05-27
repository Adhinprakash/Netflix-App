
import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';

class CustombuttonWidget extends StatelessWidget {
  const CustombuttonWidget({
    super.key,
    required this.icon,
    required this.title
  });
final IconData icon;
final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: kwhitecolor,size: 30,),
        Text(title,style: const TextStyle(fontSize: 18),)
      ],
    );
  }
}
