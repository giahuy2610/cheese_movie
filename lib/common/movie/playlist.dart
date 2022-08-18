//the Playlist class storing the list of movies which matched with the client's movie filter
class Playlist {
  late final listOfMovies;
  Playlist(this.listOfMovies);

  factory Playlist.fetchJsonGetMoviesByNewUpdated(Map<String, dynamic> json) {
    var tempListOfMoviesRaw = json['items'];
    List<String> tempListOfMovies = List<String>.empty(growable: true);

    for (final e in tempListOfMoviesRaw) {
      tempListOfMovies.add(e['slug']);
    }

    return Playlist(tempListOfMovies);
  }

  factory Playlist.fetchJsonGetMoviesByCategory(Map<String, dynamic> json) {
    var tempListOfMoviesRaw = json['pageProps']['data']['items'];
    print(tempListOfMoviesRaw.length);
    List<String> tempListOfMovies = List<String>.empty(growable: true);

    for (final e in tempListOfMoviesRaw) {
      tempListOfMovies.add(e['slug']);
      print(e['slug']);
    }

    return Playlist(tempListOfMovies);
  }
}
