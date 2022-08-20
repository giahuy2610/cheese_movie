import 'package:flutter/material.dart';
import '../../../common/movie/recentMovie.dart';
import '../../../providers/const.dart';
import 'continueWatchingMovieCard.dart';

class WatchingMoviePage extends StatefulWidget {
  List<RecentMovie> watchingList;
  WatchingMoviePage(this.watchingList, {Key? key}) : super(key: key);

  @override
  State<WatchingMoviePage> createState() =>
      _WatchingMoviePageState(watchingList);
}

class _WatchingMoviePageState extends State<WatchingMoviePage> {
  List<RecentMovie> watchingList;

  _WatchingMoviePageState(this.watchingList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Phim vừa xem'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: BackButton(),
        ),
        body: Container(
          //padding: EdgeInsets.all(20),
          width: Const.screenWidth,
          height: Const.screenHeight,
          child: ListView(
            children: [
              for (var e in watchingList) ContinuteWatchingMovieCard(e)
            ],
          ),
        ));
  }
}
