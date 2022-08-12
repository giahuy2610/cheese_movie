import 'package:flutter/material.dart';
import '../../../providers/const.dart';
import '../../../common/player/player.dart';
import '.././categoryButton.dart';
import './movieFilteredByCategoryCard.dart';
import '../../../models/futureGetMoviesByCategory.dart';
import '../../../models/futureGetMovies.dart';
import '../../../common/movie/movie.dart';
import '../../../common/movie/playlist.dart';
import './movieFilteredByCategoryCard.dart';

class FilteredByCategoryPage extends StatefulWidget {
  const FilteredByCategoryPage({Key? key}) : super(key: key);

  @override
  State<FilteredByCategoryPage> createState() => _FilteredByCategoryPageState();
}

class _FilteredByCategoryPageState extends State<FilteredByCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: Const.screenWidth,
      height: Const.screenHeight,
      child: ListView(
        children: [
          Text('The loai'),
          FutureBuilder<Playlist>(
              future: FutureGetMoviesByCategory('hanh-dong'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> slugList =
                      snapshot.data?.listOfMovies as List<String>;
                  return Container(
                    constraints:
                        BoxConstraints(maxHeight: Const.screenHeight * 0.7),
                    child: Column(children: [
                      Expanded(
                          child: ListView(children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            for (String e in slugList)
                              FutureBuilder<Movie>(
                                future: FutureGetMovies(e),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return MovieFilteredByCategoryCard(
                                        snapshot.data);
                                  } else
                                    return Text('${snapshot.error}');
                                },
                              ),
                          ],
                        )
                      ]))
                    ]),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
