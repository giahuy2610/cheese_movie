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

class FilteredByCategoryPage extends StatelessWidget {
  final category;
  final path;
  FilteredByCategoryPage(this.category, this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: BackButton(),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          width: Const.screenWidth,
          height: Const.screenHeight,
          child: ListView(
            children: [
              Text('The loai $category'),
              FutureBuilder<Playlist>(
                  future: FutureGetMoviesByCategory(path),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<String> slugList =
                          snapshot.data?.listOfMovies as List<String>;
                      return Container(
                        constraints:
                            BoxConstraints(maxHeight: Const.screenHeight),
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
        ));
  }
}
