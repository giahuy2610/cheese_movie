import 'package:flutter/material.dart';
import '../../../providers/const.dart';
import './movieFilteredByCategoryCard.dart';
import '../../../models/futureGetMoviesByCategory.dart';
import '../../../models/futureGetMovies.dart';
import '../../../common/movie/movie.dart';
import '../../../common/movie/playlist.dart';
import '../../../common/customSearchDelegate/customSearchDelegate.dart';

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
  var pageNum = 1;
  List<String> slugList = List<String>.empty(growable: true);

  _FilteredByCategoryPageState(this.category, this.path);
  final scrollController = ScrollController();

  initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) loadNextPage();
    });
  }

  Future<bool> loadNextPage() async {
    setState(() {
      pageNum++;
    });

    return true;
  }

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
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => CustomSearchDelegate()));
                },
                icon: Icon(Icons.search_rounded))
          ],
        ),
        body: GestureDetector(
            onHorizontalDragUpdate: (details) {
// Note: Sensitivity is integer used when you don't want to mess up vertical drag
              int sensitivity = 8;
              if (details.delta.dx > sensitivity) {
// Right Swipe
              } else if (details.delta.dx < -sensitivity) {
                Navigator.pop(context);
              }
            },
            child: Container(
                child: FutureBuilder<Playlist>(
                    future: FutureGetMoviesByCategory(path, pageNum),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        slugList += snapshot.data?.listOfMovies as List<String>;
                        return Container(
                          constraints:
                              BoxConstraints(maxHeight: Const.screenHeight),
                          child: Column(children: [
                            Expanded(
                                child: ListView(
                                    controller: scrollController,
                                    children: [
                                  Wrap(
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
                    }))));
  }
}
