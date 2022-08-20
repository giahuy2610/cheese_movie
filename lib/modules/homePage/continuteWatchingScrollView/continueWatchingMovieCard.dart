import 'package:cheese_movie/models/futureGetMovies.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import '../../../common/movie/movie.dart';
import '../../../models/addToBookmark.dart';
import '../../../models/createSharingDyamicLink.dart';
import '../../../models/storeRecentMovieCache.dart';
import '../../../providers/controller.dart';
import '../../engjoyMoviePage/enjoyMoviePage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContinuteWatchingMovieCard extends StatelessWidget {
  final recentMovie;
  const ContinuteWatchingMovieCard(this.recentMovie);

  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
        future: FutureGetMovies(recentMovie.slug),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GlassmorphicContainer(
              borderRadius: 20,
              blur: 20,
              border: 0,
              linearGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.15),
                    const Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  const Color((0xFFFFFFFF)).withOpacity(0.5),
                  const Color(0xFFffffff).withOpacity(0.5),
                ],
              ),
              height: 80,
              width: 1000,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EnjoyMoviePage(snapshot.data);
                    }));
                  },
                  child: Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),

                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (_) {
                              deleteRecentMovie(recentMovie.slug);
                              context.read<Controller>().setIsChangeWatchingMovieList();
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (_) {
                              CreateSharingDynamicLink(recentMovie.slug)
                                  .then((value) => Share.share(value));
                            },
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                          SlidableAction(
                            // An action can be bigger than the others.
                            // flex: 2,
                            onPressed: (_) {
                              AddToBookmark(recentMovie.slug, '1');
                            },
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.star_border,
                            label: 'Bookmark',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(
                                          snapshot.data?.thumb_url ?? '',
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data?.originName ?? '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                          ),
                                          Text(
                                            snapshot.data?.name ?? '',
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircularProgressIndicator(
                                    value: 1.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.transparent),
                                  ),
                                  CircularProgressIndicator(
                                    value: int.parse(
                                            recentMovie.positionInSeconds) /
                                        (int.parse(recentMovie
                                                    .durationInSeconds) ==
                                                0
                                            ? 1
                                            : int.parse(
                                                recentMovie.durationInSeconds)),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.red),
                                  ),
                                  const Icon(Icons.play_arrow_outlined)
                                ],
                              ),
                            )
                          ],
                        ),
                      ))),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Container();
          }
        });
  }
}
