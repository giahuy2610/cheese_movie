import 'package:flutter/material.dart';
import '../../providers/const.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final videoPlayerController = VideoPlayerController.network(
      'https://kd.hd-bophim.com/20220811/19954_dcb9681b/index.m3u8');
  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.screenWidth / 3 * 2,
      child: Chewie(controller: chewieController),
    );
  }
}
