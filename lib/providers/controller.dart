import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool isDarkMode = true;
  bool isLogin = false;
  var currentMovie;

  void setDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void setLogIn() {
    notifyListeners();
  }
}
