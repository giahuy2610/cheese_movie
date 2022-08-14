import 'package:flutter/material.dart';
import './continueWatchingMovieCard.dart';

class ContinuteWatchingScrollView extends StatelessWidget {
  const ContinuteWatchingScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đang xem',
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextButton(onPressed: () {}, child: Text("Tất cả"))
              ],
            ),
            ContinuteWatchingMovieCard(),
            ContinuteWatchingMovieCard(),
            ContinuteWatchingMovieCard(),
            ContinuteWatchingMovieCard(),
          ],
        ));
  }
}
