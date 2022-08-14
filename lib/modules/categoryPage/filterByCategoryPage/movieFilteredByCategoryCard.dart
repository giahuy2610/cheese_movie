import 'package:flutter/material.dart';
import '../../../providers/const.dart';
import '../../engjoyMoviePage/enjoyMoviePage.dart';

class MovieFilteredByCategoryCard extends StatelessWidget {
  final movie;
  const MovieFilteredByCategoryCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EnjoyMoviePage(movie);
            }));
          },
          child: Container(
            width: Const.screenWidth * 0.35,
            height: 200,
            constraints: BoxConstraints(maxWidth: Const.screenWidth * 0.35),
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
          ))
    );
  }
}
