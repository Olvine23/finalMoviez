import 'dart:io';

import 'package:http/http.dart' as http;

class ApiServices {
  // get all shows
  static Future<List<Object>> fetchallShows() async {
    // try{
    var res = await http.get(
      Uri.parse("https://api.tvmaze.com/shows"),
    );
    var list = [res.body, res.statusCode];

    return list;
    // } on SocketException{
    //   throw  Exception("N");

    // }
  }

  // get a searched show
  static Future<List<Object>> searchShows(String query) async {
    var res = await http.get(
      Uri.parse("https://api.tvmaze.com/search/shows?q=$query"),
    );
    var list = [res.body, res.statusCode];

    return list;
  }

  //get show episodes

  static Future<List<Object>> fetchEpisodes() async {
    var res =
        await http.get(Uri.parse("https://api.tvmaze.com/shows/1/episodes"));

    var list = [res.body, res.statusCode];

    // ignore: avoid_print
    print(list[0]);

    return list;
  }

  //get cast details

  static Future<List<Object>> fetchCast(dynamic int) async {
    var res =
        await http.get(Uri.parse("https://api.tvmaze.com/shows/$int/cast"));

    var list = [res.body, res.statusCode];

    return list;
  }

  //get images

  static Future<List<Object>> fetchImages(dynamic int) async{

    var res = await http.get(Uri.parse("https://api.tvmaze.com/shows/$int/images"));

    var list =[res.body, res.statusCode];

    return list;



  }
}
