import 'package:cheese_movie/models/futureGetBookmark.dart';
import 'package:flutter/material.dart';
import '../../common/movie/playlist.dart';
import '../../providers/const.dart';
import '../../models/futureGetMovies.dart';
import '../../common/movie/movie.dart';
import '../../modules/categoryPage/filterByCategoryPage/movieFilteredByCategoryCard.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: FutureBuilder<Playlist>(
            future: FutureGetBookmark(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<String> slugList =
                    snapshot.data?.listOfMovies as List<String>;
                return Container(
                  constraints: BoxConstraints(maxHeight: Const.screenHeight),
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
            }));
  }
}

// void test() async {
//   final ref = FirebaseDatabase.instance.ref();
//
//   final snapshot = await ref.child('users/${FirebaseAuth.instance.currentUser?.uid}').get();
//
//
//   print(1);
//   if (snapshot.exists) {
//     snapshot.children.forEach((element) {
//       print(element.key);
//     });
//   } else {
//     print('No data available.');
//   }
// }
