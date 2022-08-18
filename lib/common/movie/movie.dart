import 'package:cheese_movie/common/movie/episode.dart';
import 'package:flutter/material.dart';

class Movie {
  late String id;
  late String name;
  late String originName;
  late String content;
  late String type;
  late String status; //completed
  late String thumb_url;
  late String poster_url;
  late String episode_current; //Full,
  late String episode_total;
  late var actors;
  late var directors;
  late var categories;
  late var countries;
  late List<Episode> episodes = List<Episode>.empty(
      growable:
          true); //the list storing episodes , ex:([{"server_name":"Vietsub #1","server_data":[{"name":"Full","slug":"full","filename":"Doom.2005.x264.720P.Bluray.DTS.x264-CHD","link_embed":"https://kd.hd-bophim.com/share/7fd1b2b2c47abff68e7300061e48039b","link_m3u8":"https://kd.hd-bophim.com/20220811/19954_dcb9681b/index.m3u8"}]}])
  late var time;
  late var slug;
  late int year;

  Movie(
      this.id,
      this.name,
      this.originName,
      this.content,
      this.type,
      this.status,
      this.thumb_url,
      this.time,
      this.episode_current,
      this.episode_total,
      this.slug,
      this.year,
      this.actors,
      this.directors,
      this.categories,
      this.countries,
      this.poster_url,
      this.episodes);

  factory Movie.fetchJsonGetMovies(Map<String, dynamic> json) {
    var tempMovie = json['movie'];
    var tempEpisodes = json['episodes'][0]['server_data'];

    List<Episode> tempListOfEpisodes = List<Episode>.empty(growable: true);
    for (final episode in tempEpisodes) {
      tempListOfEpisodes.add(Episode(episode['name'], episode['slug'],
          episode['filename'], episode['link_m3u8']));
    }
    print('id' + tempMovie['_id']);
    return Movie(
        tempMovie['_id'],
        tempMovie['name'],
        tempMovie['origin_name'],
        tempMovie['content'].substring(3, tempMovie['content'].length - 4),
        tempMovie['type'],
        tempMovie['status'],
        tempMovie['thumb_url'],
        tempMovie['time'],
        tempMovie['episode_current'],
        tempMovie['episode_total'],
        tempMovie['slug'],
        tempMovie['year'],
        tempMovie['actor']
            .toString()
            .substring(1, tempMovie['actor'].toString().length - 1),
        tempMovie['director']
            .toString()
            .substring(1, tempMovie['director'].toString().length - 1),
        tempMovie['category']
            .toString()
            .substring(1, tempMovie['category'].toString().length - 1),
        tempMovie['country']
            .toString()
            .substring(1, tempMovie['country'].toString().length - 1),
        tempMovie['poster_url'],
        tempListOfEpisodes);
  }
}
