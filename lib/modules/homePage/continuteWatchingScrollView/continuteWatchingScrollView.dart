import 'package:cheese_movie/common/movie/recentMovie.dart';
import 'package:cheese_movie/modules/homePage/continuteWatchingScrollView/watchingMoviePage.dart';
import 'package:cheese_movie/providers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/storeRecentMovieCache.dart';
import './continueWatchingMovieCard.dart';

class ContinuteWatchingScrollView extends StatefulWidget {
  const ContinuteWatchingScrollView({Key? key}) : super(key: key);

  @override
  State<ContinuteWatchingScrollView> createState() => _ContinuteWatchingScrollViewState();
}

class _ContinuteWatchingScrollViewState extends State<ContinuteWatchingScrollView> {


  Widget build(BuildContext context) {
    context.select<Controller, int>((e) => e.isChangeWatchingMovieList);
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
                            temp.length > 4
                                ? TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  WatchingMoviePage(temp)));
                                    },
                                    child: Text("Tất cả"))
                                : Container()
                          ],
                        ),
                        if (snapshot.data != null)
                          for (var e
                              in (temp.length > 4 ? temp.sublist(0, 4) : temp))
                            ContinuteWatchingMovieCard(e)
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
