import 'package:flutter/material.dart';
import 'movieDetailsCard/movieDetailsCard.dart';
import '../../providers/const.dart';
import '../../common/player/player.dart';
import '../../../providers/controller.dart';
import 'package:provider/provider.dart';

class EnjoyMoviePage extends StatelessWidget {
  final movie;
  const EnjoyMoviePage(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined))
        ],
      ),
      body: Column(children: [
        Player(movie.episodes[0].link_m3u8),
        Expanded(child: MovieDetailsCard(movie)),
      ]),
    );
  }
}
