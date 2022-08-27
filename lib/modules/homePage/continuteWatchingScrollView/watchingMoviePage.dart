import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/movie/recentMovie.dart';
import '../../../providers/const.dart';
import '../../../providers/controller.dart';
import 'continueWatchingMovieCard.dart';

class WatchingMoviePage extends StatefulWidget {
  List<RecentMovie> watchingList;
  WatchingMoviePage(this.watchingList, {Key? key}) : super(key: key);

  @override
  State<WatchingMoviePage> createState() =>
      _WatchingMoviePageState(watchingList);
}

class _WatchingMoviePageState extends State<WatchingMoviePage>
    with SingleTickerProviderStateMixin {
  List<RecentMovie> watchingList;
  var _controller;
  _WatchingMoviePageState(this.watchingList);

  @override
  Widget build(BuildContext context) {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Phim vừa xem'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: BackButton(),
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
              //padding: EdgeInsets.all(20),
              width: Const.screenWidth,
              height: Const.screenHeight,
              child: AnimatedList(
                  key: context.read<Controller>().watchingListGlobalKey,
                  initialItemCount: watchingList.length,
                  itemBuilder: (context, index, animation) {
                    final item = watchingList[index];
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(1.5, 0.0),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.elasticIn,
                      )),
                      child: ContinuteWatchingMovieCard(
                        watchingList[index],
                        key: Key(index.toString()),
                      ),
                    );
                  }),
            )));
  }
}
