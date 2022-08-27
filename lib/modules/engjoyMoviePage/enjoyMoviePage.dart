import 'package:flutter/material.dart';
import 'movieDetailsCard/movieDetailsCard.dart';
import '../../common/player/player.dart';
import '../../../providers/controller.dart';
import 'package:provider/provider.dart';
import '../../models/addToBookmark.dart';

class EnjoyMoviePage extends StatelessWidget {
  final movie;
  var episode;
  var positionInSeconds;
  EnjoyMoviePage(this.movie, {Key? key, this.episode, this.positionInSeconds})
      : super(key: key);
  //constructor has episode and position only if is continue playing a incomplete watching movie

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: const BackButton(),
          actions: [
            context
                    .select<Controller, List<String>>((e) => e.bookmarkSlug)
                    .contains(movie.slug)
                ? IconButton(
                    onPressed: () {}, icon: const Icon(Icons.bookmark_remove))
                : IconButton(
                    onPressed: () {
                      AddToBookmark(movie.slug, '1');
                    },
                    icon: const Icon(Icons.bookmark_add_outlined))
          ],
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
          child: Column(children: [
            Player(movie),
            Expanded(child: MovieDetailsCard(movie)),
          ]),
        ));
  }
}
