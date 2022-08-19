import 'package:flutter/material.dart';
import '../../providers/const.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../../../providers/controller.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/storeRecentMovieCache.dart';

class Player extends StatefulWidget {
  var link_m3u8;
  Player(this.link_m3u8, {Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState(link_m3u8);
}

class _PlayerState extends State<Player> {
  late var link_m3u8;
  late var videoPlayerController;
  late ChewieController chewieController;

  _PlayerState(this.link_m3u8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var temp = context.select<Controller, String?>((e) => e.currentLink_m3u8);
    var temp2 = link_m3u8;
    temp == null ? 1 : temp2 = temp;

    return VisibilityDetector(
        key: Key('player'),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0) {
            addNewRecentMovie(
                'digimon-tamers',
                '1',
                videoPlayerController.value.duration.inSeconds,
                videoPlayerController.value.position.inSeconds);

            videoPlayerController.pause(); //pausing  functionality
            videoPlayerController.dispose();
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
