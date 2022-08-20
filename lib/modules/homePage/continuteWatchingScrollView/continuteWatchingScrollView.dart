import 'package:cheese_movie/common/movie/recentMovie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../../models/storeRecentMovieCache.dart';
import './continueWatchingMovieCard.dart';

class ContinuteWatchingScrollView extends StatelessWidget {
  const ContinuteWatchingScrollView({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   var continuteWatchingList ;
  //   getRecentMovieList().then((value) => continuteWatchingList = value);
  //   print('widget loading watching movie');
  //   if (continuteWatchingList != null) {
  //     return Container(
  //       padding: EdgeInsets.all(20),
  //       child: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const Text(
  //                 'Đang xem',
  //                 overflow: TextOverflow.fade,
  //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //               ),
  //               TextButton(onPressed: () {}, child: Text("Tất cả"))
  //             ],
  //           ),
  //           // ContinuteWatchingMovieCard(),
  //           // ContinuteWatchingMovieCard(),
  //           // ContinuteWatchingMovieCard(),
  //           // ContinuteWatchingMovieCard(),
  //           for (var e in continuteWatchingList)
  //             Text(e.slug)
  //         ],
  //       ));
  //   } else
  //     return Container();
  //
  // }
  //
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<RecentMovie>>(
          future: getRecentMovieList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                List<RecentMovie> temp = snapshot.data as List<RecentMovie>;
                return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Đang xem',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextButton(onPressed: () {}, child: Text("Tất cả"))
                          ],
                        ),
                        if (snapshot.data != null)
                          for (var e in temp) ContinuteWatchingMovieCard(e)
                      ],
                    ));
              } else
                return Container();
            } else if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return Container();
          }),
    );
  }
}
