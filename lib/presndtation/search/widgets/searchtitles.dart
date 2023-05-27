import 'package:flutter/material.dart';

class SearchTexttitle extends StatelessWidget {
  final String searchtitle;

  const SearchTexttitle({super.key, required this.searchtitle});
  @override
  Widget build(BuildContext context) {
    return Text(searchtitle,
        style: const TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
  }
}
