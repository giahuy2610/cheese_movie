//oldest updated movies
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../common/movie/playlist.dart';

Future<Playlist> FutureGetMoviesByNewUpdated() async {
  final response = await http
      .get(Uri.parse('https://ophim1.com/danh-sach/phim-moi-cap-nhat?page=1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Playlist.fetchJsonGetMoviesByNewUpdated(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies');
  }
}
