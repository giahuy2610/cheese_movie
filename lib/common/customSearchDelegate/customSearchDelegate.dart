import 'package:cheese_movie/common/movie/playlist.dart';
import 'package:flutter/material.dart';
import '../../models/futureGetMoviesBySearch.dart';
import '../movie/movie.dart';
import '../../providers/const.dart';
import '../../models/futureGetMovies.dart';
import '../../modules/categoryPage/filterByCategoryPage/movieFilteredByCategoryCard.dart';

class CustomSearchDelegate extends StatefulWidget {
  const CustomSearchDelegate({Key? key}) : super(key: key);

  @override
  State<CustomSearchDelegate> createState() => _CustomSearchDelegateState();
}

class _CustomSearchDelegateState extends State<CustomSearchDelegate> {
  final myControllerTextField = TextEditingController();
  var keyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              setState(() {
                keyword = myControllerTextField.text;
              });
              //value is entered text after ENTER press
              //you can also call any function here or make setState() to assign value to other variable
            },
            controller: myControllerTextField,
            autofocus: true,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    myControllerTextField.clear();
                    setState(() {
                      keyword = '';
                    });
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: keyword == '' ? Container() : Container(
          child: FutureBuilder<Playlist>(
              future: FutureGetMoviesBySearch(keyword),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> slugList =
                      snapshot.data?.listOfMovies as List<String>;
                      for (var item in slugList)
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
              })),
    );
  }
}

// class CustomSearchDelegate extends StatelessWidget {
//   final myControllerTextField = TextEditingController();
//   CustomSearchDelegate({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       appBar: AppBar(
//           // The search area here
//           title: Container(
//         width: double.infinity,
//         height: 40,
//         decoration: BoxDecoration(
//             color: Colors.white12, borderRadius: BorderRadius.circular(5)),
//         child: Center(
//           child: TextField(
//             onSubmitted: (value) {
//               print(myControllerTextField.value);
//               //value is entered text after ENTER press
//               //you can also call any function here or make setState() to assign value to other variable
//             },
//             controller: myControllerTextField,
//             autofocus: true,
//             decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     myControllerTextField.clear();
//                   },
//                 ),
//                 hintText: 'Search...',
//                 border: InputBorder.none),
//           ),
//         ),
//       )),
//       body: Container(
//           child: FutureBuilder<Playlist>(
//               future: FutureGetMoviesBySearch(path),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   List<String> slugList =
//                       snapshot.data?.listOfMovies as List<String>;
//                   return Container(
//                     constraints: BoxConstraints(maxHeight: Const.screenHeight),
//                     child: Column(children: [
//                       Expanded(
//                           child: ListView(children: [
//                         Wrap(
//                           alignment: WrapAlignment.center,
//                           children: [
//                             for (String e in slugList)
//                               FutureBuilder<Movie>(
//                                 future: FutureGetMovies(e),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.hasData) {
//                                     return MovieFilteredByCategoryCard(
//                                         snapshot.data);
//                                   } else if (snapshot.hasError)
//                                     return Text('${snapshot.error}');
//                                   else
//                                     return Container();
//                                 },
//                               ),
//                           ],
//                         )
//                       ]))
//                     ]),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('${snapshot.error}');
//                 }
//                 return Container();
//               })),
//     );
//   }
// }
