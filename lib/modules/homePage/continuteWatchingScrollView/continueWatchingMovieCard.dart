import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ContinuteWatchingMovieCard extends StatelessWidget {
  // final movie;
  // final episode;
  // final totalTime;
  // final watchedTime;
  //
  // const ContinuteWatchingMovieCard(
  //     this.movie, this.episode, this.totalTime, this.watchedTime,
  //     {Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            'https://ophim.cc/_next/image?url=https%3A%2F%2Fimg.ophim.cc%2Fuploads%2Fmovies%2Fam-thuc-duong-pho-hoa-ky-thumb.jpg&w=384&q=75',
                            fit: BoxFit.fill,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ten',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            'movie.name',
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.play_arrow_outlined))
              ],
            ),
          )),
    );
  }
}
