import 'package:http/http.dart' as http;

class ApiServices {
  // get all shows
  static Future<List<Object>> fetchallShows() async {
    var res = await http.get(
      Uri.parse("https://api.tvmaze.com/shows"),
    );
    var list = [res.body, res.statusCode];

    return list;
  }

  // get a searched show
  static Future<List<Object>> searchShows(String query) async {
    var res = await http.get(
      Uri.parse("https://api.tvmaze.com/search/shows?q=$query"),
    );
    var list = [res.body, res.statusCode];

    return list;
  }
}
