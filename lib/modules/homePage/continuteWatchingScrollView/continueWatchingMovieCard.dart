import 'package:cheese_movie/models/futureGetMovies.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../../common/movie/movie.dart';
import '../../engjoyMoviePage/enjoyMoviePage.dart';

class ContinuteWatchingMovieCard extends StatelessWidget {
  final recentMovie;
  ContinuteWatchingMovieCard(this.recentMovie);

  @override
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
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                  Color(0xFFffffff).withOpacity(0.5),
                ],
              ),
              height: 80,
              width: 1000,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EnjoyMoviePage(snapshot.data);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Image.network(
                                      snapshot.data?.thumb_url ?? '',
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data?.originName ?? '',
                                        style: TextStyle(
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
                                    (int.parse(recentMovie.durationInSeconds) ==
                                            0
                                        ? 1
                                        : int.parse(
                                            recentMovie.durationInSeconds)),
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                              Icon(Icons.play_arrow_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            return Container();
        });
  }
}
