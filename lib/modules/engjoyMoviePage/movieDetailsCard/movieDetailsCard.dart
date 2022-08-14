import 'package:flutter/material.dart';
import './episodesListScrollView.dart';

class MovieDetailsCard extends StatelessWidget {
  final movie;
  const MovieDetailsCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //     color: Colors.pinkAccent,
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.originName + '-' + movie.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(
              'Diễn viên: ${movie.actors.toString()}',
            ),
            Text('Đạo diễn: ${movie.directors.toString()}'),
            Text(
              'Thời lượng: ${movie.time}',
            )
          ],
        ),
        EpisodesListScrollView(movie.episodes),
        Text('Nội dung: ${movie.content}'),
        Row(
          children: [Text('Buy ticket')],
        )
      ],
    );
  }
}
