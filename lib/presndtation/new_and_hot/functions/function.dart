import 'dart:convert';

import 'package:netflixapp/domain/movies/movies.dart';
import 'package:http/http.dart'as http;
import 'package:netflixapp/domain/pages/pages.dart';
class NewAndHotFunctions{
  static List<Movies>discover=[];
  static Future<void>getDiscover()async{
    try{
     final response=await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=ab0cf082753847fe198b04d1318daa57"));
     if(response.statusCode==200){
      Map<String,dynamic>data=jsonDecode(response.body);
      Pages pages=Pages.fromJson(data);
      discover.addAll(pages.results!);
     }
    }
    catch(e){
      print(e);
    }
  }
}