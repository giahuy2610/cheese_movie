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
  int currentPage = 0;
  final PageController _controller = PageController(viewportFraction: 0.8);
  List<String> slugList = List<String>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 4)).then((_) {
      int nextPage = _controller.page!.round() + 1;

      if (nextPage == slugList.length) {
        nextPage = 0;
      }

      _controller
          .animateToPage(nextPage,
              duration: Duration(seconds: 1), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Playlist>(
        future: FutureGetMoviesByNewUpdated(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            slugList = snapshot.data?.listOfMovies as List<String>;
            return Container(
              constraints: BoxConstraints(maxHeight: Const.screenHeight * 0.7),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Phim mới',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                    Expanded(
                        child: PageView(
                      controller: _controller,
                      children: [
                        for (String e in slugList)
                          FutureBuilder<Movie>(
                            future: FutureGetMovies(e),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MovieCard(snapshot.data);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              } else {
                                return Container();
                              }
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
