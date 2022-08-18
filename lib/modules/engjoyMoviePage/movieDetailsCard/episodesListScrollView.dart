import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../providers/controller.dart';
import 'package:provider/provider.dart';

class EpisodesListScrollView extends StatefulWidget {
  var episodes;
  EpisodesListScrollView(this.episodes, {Key? key}) : super(key: key);

  @override
  State<EpisodesListScrollView> createState() =>
      _EpisodesListScrollViewState(episodes);
}

class _EpisodesListScrollViewState extends State<EpisodesListScrollView> {
  var currentEpisode = 1;
  var episodes;

  _EpisodesListScrollViewState(this.episodes);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var i = 1; i <= episodes.length; i++)
              GlassmorphicContainer(
                borderRadius: 20,
                blur: 20,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: i == currentEpisode
                        ? [
                            Colors.yellow.withOpacity(0.8),
                            Colors.yellowAccent.withOpacity(0.5),
                          ]
                        : [
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
                height: 50,
                width: 80,
                alignment: Alignment.center,
                margin: i == 1
                    ? EdgeInsets.only(right: 10)
                    : i == episodes.length
                        ? EdgeInsets.only(left: 10)
                        : EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      context
                          .read<Controller>()
                          .changeLink_m3u8(episodes[i - 1].link_m3u8);
                      setState(() {
                        currentEpisode = i;
                      });
                    },
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      alignment: Alignment.center,
                      child: episodes[0].name == ''
                          ? Text('Sắp ra mắt')
                          : Text('Tập ${episodes[i - 1].name}'),
                    )),
              )
          ],
        ));
  }
}
