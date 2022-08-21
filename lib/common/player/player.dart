import 'package:flutter/material.dart';
import '../../providers/const.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../../../providers/controller.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../models/storeRecentMovieCache.dart';

class Player extends StatefulWidget {
  var movie;
  Player(this.movie, {Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState(movie);
}

class _PlayerState extends State<Player> {
  late var movie;
  late var videoPlayerController;
  late ChewieController chewieController;

  _PlayerState(this.movie);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var temp = context.select<Controller, String?>((e) => e.currentLink_m3u8);
    var temp2 = movie.episodes[0].link_m3u8;
    temp == null ? 1 : {temp2 = temp};

    return VisibilityDetector(
        key: Key('player'),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0) {
            addNewRecentMovie(
                movie.slug,
                '1',
                videoPlayerController.value.duration.inSeconds,
                videoPlayerController.value.position.inSeconds);

            videoPlayerController.pause(); //pausing  functionality
            videoPlayerController.dispose();
            context.read<Controller>().setIsChangeWatchingMovieList();
          }
        },
        child: Container(
          height: Const.screenWidth / 3 * 2,
          child: Chewie(
              controller: ChewieController(
            videoPlayerController: videoPlayerController =
                VideoPlayerController.network(temp2),
            aspectRatio: 3 / 2,
            autoPlay: true,
            looping: false,
          )),
        ));
  }
}
