import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'f090d315fbe1832f30d8e1f44db8d2ae';

  Future<dynamic> methodGet() async {
    var response =
        await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      var item = json.decode(response.body);
      print(item);
      return item;
    } else {
      print('not connected to rest api');
    }
  }
}
