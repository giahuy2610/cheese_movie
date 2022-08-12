import 'package:flutter/material.dart';
import '../../engjoyMoviePage/enjoyMoviePage.dart';
import '../../../providers/const.dart';

class MovieCard extends StatelessWidget {
  final movie;
  const MovieCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EnjoyMoviePage(movie);
          }));
        },
        child: Container(
          width: Const.screenWidth * 0.6,
          margin: EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(maxWidth: Const.screenWidth * 0.6),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      movie.thumb_url,
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      movie.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      movie.actors.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
