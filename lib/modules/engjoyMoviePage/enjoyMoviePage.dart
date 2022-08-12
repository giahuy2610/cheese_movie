import 'package:flutter/material.dart';
import './movieDetailsCard.dart';
import '../../providers/const.dart';
import '../../common/player/player.dart';

class EnjoyMoviePage extends StatelessWidget {
  final movie;
  const EnjoyMoviePage(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined))
        ],
      ),
      body: Column(children: [
        Player(),
        Expanded(child: MovieDetailsCard(movie)),
      ]),
    );
  }
}
