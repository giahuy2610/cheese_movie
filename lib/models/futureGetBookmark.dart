//oldest updated movies
import 'dart:async';
import 'package:cheese_movie/common/movie/playlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<Playlist> FutureGetBookmark() async {
  final ref = FirebaseDatabase.instance.ref();

  final snapshot =
      await ref.child('users/${FirebaseAuth.instance.currentUser?.uid}').get();

  if (snapshot.exists) {
    List<String> tempListOfMovies = List<String>.empty(growable: true);
    for (var element in snapshot.children) {
      tempListOfMovies.add(element.children.first.key.toString());
    }

    return Playlist(tempListOfMovies);
  } else {
    throw Exception('Failed to load movies');
  }
}
