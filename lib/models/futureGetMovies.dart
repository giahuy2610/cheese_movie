//oldest updated movies
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../common/movie/movie.dart';

Future<Movie> FutureGetMovies(String slug) async {
  final response = await http.get(Uri.parse('https://ophim1.com/phim/${slug}'));
  print('https://ophim1.com/phim/${slug}');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Movie.fetchJsonGetMovies(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies');
  }
}
