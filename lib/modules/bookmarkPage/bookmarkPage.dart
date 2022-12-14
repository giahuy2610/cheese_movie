import 'package:cheese_movie/models/futureGetBookmark.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/movie/playlist.dart';
import '../../providers/const.dart';
import '../../models/futureGetMovies.dart';
import '../../common/movie/movie.dart';
import '../../modules/categoryPage/filterByCategoryPage/movieFilteredByCategoryCard.dart';
import '../../providers/controller.dart';
import '../userPage/loginPage/loginPage.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: context.select<Controller, bool>((e) => e.isLogin)
            ? FutureBuilder<Playlist>(
                future: FutureGetBookmark(),
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
                            alignment: WrapAlignment.start,
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
                    return Container(
                      child: Text("B???n ch??a c?? phim y??u th??ch"),
                    );
                  }
                  return Container();
                })
            : TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white24),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text('????ng nh???p ????? ti???p t???c')));
  }
}
