import 'package:cheese_movie/common/movie/playlist.dart';
import 'package:flutter/material.dart';
import './movieCard.dart';
import '../../../common/movie/movie.dart';
import '../../../models/futureGetMovies.dart';
import '../../../models/futureGetMoviesByNewUpdated.dart';
import '../../../providers/const.dart';
import 'dart:async';

class RecentScrollView extends StatefulWidget {
  const RecentScrollView({Key? key}) : super(key: key);

  @override
  State<RecentScrollView> createState() => _RecentScrollViewState();
}

class _RecentScrollViewState extends State<RecentScrollView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Playlist>(
        future: FutureGetMoviesByNewUpdated(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> slugList = snapshot.data?.listOfMovies as List<String>;
            return Container(
              constraints: BoxConstraints(maxHeight: Const.screenHeight * 0.7),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Phim mới',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                    Expanded(
                        child: PageView(
                      controller:
                          PageController(initialPage: 0, viewportFraction: 0.8)
,
                      children: [
                        for (String e in slugList)
                          FutureBuilder<Movie>(
                            future: FutureGetMovies(e),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MovieCard(snapshot.data);
                              } else if (snapshot.hasError)
                                return Text('${snapshot.error}');
                              else
                                return Container();
                            },
                          ),
                      ],
                    ))
                  ]),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container();
        });
  }
}
