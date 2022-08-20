import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Controller extends ChangeNotifier {
  bool isDarkMode = true;
  bool isLogin = FirebaseAuth.instance.currentUser == null ? false : true;
  var currentMovie;
  var currentEpisode;
  var currentLink_m3u8;
  List<String> bookmarkSlug = List<String>.empty(growable: true);

  void setBookmarkSlug(List<String> newBookmark) {
    bookmarkSlug = newBookmark;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void setLogIn(bool value) {
    isLogin = value;
    notifyListeners();
  }

  void changeMovie() {
    notifyListeners();
  }

  void changeEpisode(String newEpisode) {
    currentEpisode = newEpisode;
    notifyListeners();
  }

  void changeLink_m3u8(String newLink) {
    print('change to $newLink');
    currentLink_m3u8 = newLink;
    notifyListeners();
  }
}
