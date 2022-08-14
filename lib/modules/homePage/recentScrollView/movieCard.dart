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
          child: Stack(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      movie.thumb_url,
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      movie.name,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
