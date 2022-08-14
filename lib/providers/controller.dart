import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool isDarkMode = true;
  bool isLogin = false;
  var currentMovie;
  var currentEpisode;
  var currentLink_m3u8;

  void setDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void setLogIn() {
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
    currentLink_m3u8 = newLink;
    notifyListeners();
  }
}
