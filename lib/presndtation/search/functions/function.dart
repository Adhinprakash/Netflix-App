
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflixapp/domain/movies/movies.dart';
import 'package:http/http.dart' as http;
import 'package:netflixapp/domain/pages/pages.dart';


class SearchFunction{
  static ValueNotifier<List<Movies>>searchData=ValueNotifier([]);
 static Future<void>searchResult(String quary)async{
    try{
  final response=await http.get(Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=2ca10457b29d3dad3777ef9ab7239b52&query=$quary'));
     if(response.statusCode==200){
      Map<String,dynamic>data=jsonDecode(response.body);
       Pages pages=Pages.fromJson(data);
       searchData.value.clear();
       searchData.value.addAll(pages.results!);
       searchData.notifyListeners();
     }
    }
    catch(e){
       print(e);
    }
  }
}