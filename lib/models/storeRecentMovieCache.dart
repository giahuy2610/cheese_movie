import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/movie/recentMovie.dart';

//saving
addNewRecentMovie(slug, episode, durationInSeconds, positionInSeconds) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var newStr = await ParserRecentMovie(
      RecentMovie(slug, episode, durationInSeconds, positionInSeconds));
  print(newStr);
  prefs.setString('recentMovieList', newStr);
}

//delete
deleteRecentMovie(slug) async {
  List<RecentMovie> newList = List<RecentMovie>.empty(growable: true);
  String newStr = '';
  await getRecentMovieList().then((value) {
    print('ban dau ' + value.length.toString());
    value.removeWhere((element) => element.slug == slug);
    print('luc sau' + value.length.toString());
    newList = value;
  });

  newList.forEach((element) {
    newStr += element.convertToString();
  });
  print(newStr);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('recentMovieList', newStr);
}

//get
getRecentMovieListString() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? temp = prefs.getString('recentMovieList');
  return temp ?? '';
}

Future<List<RecentMovie>> getRecentMovieList() async {
  print('loading watching movie');
  String oldStr = await getRecentMovieListString(); //get the last cache

  List<RecentMovie> recentList =
      List<RecentMovie>.empty(growable: true); //list of old last movie cache

  if (oldStr != '') {
    oldStr.split('#_@').forEach((e) {
      if (e != '') {
        var temp = e.split('#+_|');

        var newObj = RecentMovie(temp[0], temp[1], temp[2], temp[3]);
        recentList.add(newObj);
      }
    });
  }
  print('length of watching movie list is ' + recentList.length.toString());
  return List.from(recentList.reversed); //reverse to sort by time (lastest)
}

//parser
ParserRecentMovie(RecentMovie newMovie) async {
  String oldStr = await getRecentMovieListString(); //get the last cache
  bool isExist = oldStr.contains(
      '${newMovie.slug}#+_|'); //check if the new movie exists in the last storing
  //if exists, delete and overwrite with new episode, new position,..

  List<RecentMovie> recentList =
      List<RecentMovie>.empty(growable: true); //list of old last movie cache
  String newStr = ''; //new parsed string

  if (oldStr != '') {
    oldStr.split('#_@').forEach((e) {
      if (e != '') {
        var temp = e.split('#+_|');
        if (isExist && temp[0] == newMovie.slug)
          ;
        else {
          var newObj = RecentMovie(temp[0], temp[1], temp[2], temp[3]);
          recentList.add(newObj);
          newStr += newObj.convertToString();
        }
      }
    });
  }

  recentList.add(newMovie);
  newStr += newMovie.convertToString();

  return newStr;
}
