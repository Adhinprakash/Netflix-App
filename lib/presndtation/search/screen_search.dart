import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/constrains.dart';
import 'package:netflixapp/presndtation/search/functions/function.dart';
import 'package:netflixapp/presndtation/search/widgets/screenidle.dart';
import 'package:netflixapp/presndtation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                SearchFunction.searchResult(value); 
              },
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.4),
            ),
            kheight,
             Expanded(child: ValueListenableBuilder(valueListenable: SearchFunction.searchData, builder: (context, value, child) {
              return value.isEmpty ?SearchIdleWidget() :SearchResultWidget();
            },)),
          ],
        ),
      )),
    );
  }
}
