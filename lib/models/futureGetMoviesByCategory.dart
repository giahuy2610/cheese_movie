//oldest updated movies
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../common/movie/playlist.dart';

Future<Playlist> FutureGetMoviesByCategory(String key, int pageNum) async {
  final response = await http.get(Uri.parse(
      'https://ophim.cc/_next/data/jMo1r8lC0F6IGwkz0ayh-/the-loai/$key.json?page=$pageNum&slug=$key'));
  print(
      'https://ophim.cc/_next/data/jMo1r8lC0F6IGwkz0ayh-/the-loai/$key.json?page=$pageNum&slug=$key');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Playlist.fetchJsonGetMoviesByCategory(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies');
  }
}
