import 'package:flutter/material.dart';
import '../../../providers/const.dart';
import './movieFilteredByCategoryCard.dart';
import '../../../models/futureGetMoviesByCategory.dart';
import '../../../models/futureGetMovies.dart';
import '../../../common/movie/movie.dart';
import '../../../common/movie/playlist.dart';

class FilteredByCategoryPage extends StatefulWidget {
  final category;
  final path;
  FilteredByCategoryPage(this.category, this.path);

  @override
  State<FilteredByCategoryPage> createState() =>
      _FilteredByCategoryPageState(this.category, this.path);
}

class _FilteredByCategoryPageState extends State<FilteredByCategoryPage> {
  final category;
  final path;
  _FilteredByCategoryPageState(this.category, this.path);

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(category),
          centerTitle: true,
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
                                      } else if (snapshot.hasError)
                                        return Text('${snapshot.error}');
                                      else
                                        return Container();
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
                    return Container();
                  })
            ],
          ),
        ));
  }
}
