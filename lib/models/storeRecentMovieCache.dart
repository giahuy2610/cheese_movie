import 'dart:core';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RecentMovie {
  var slug;
  var durationInSeconds;
  var positionInSeconds;
  var timestamp;
  var episode;

  RecentMovie(
      this.slug, this.episode, this.durationInSeconds, this.positionInSeconds) {
    timestamp = DateTime.now().millisecondsSinceEpoch;
  }

  String convertToString() {
    return '$slug#+_|$episode#+_|$durationInSeconds#+_|$positionInSeconds#+_|$timestamp#_@';
  }
}

//saving
addNewRecentMovie(slug, episode, durationInSeconds, positionInSeconds) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var newStr = await getRecentMovieList() +
      RecentMovie(slug, episode, durationInSeconds, positionInSeconds)
          .convertToString();
  prefs.setString('recentMovieList', newStr);

  print(newStr);
}

//get
getRecentMovieList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? temp = prefs.getString('recentMovieList');
  return temp == null ? '' : temp;
}

//praser
praserRecentMovie() async {
  void main() {
    var a =
        'digimon-tamers#+_|1#+_|599#+_|2#+_|1660938553494#_@digimon-tamers#+_|1#+_|2692#+_|1729#+_|1660938580503#_@';
    a.split('#_@').forEach((e) {
      e.split('#+_|').forEach((k) {
        print(k);
      });
    });
  }
}
