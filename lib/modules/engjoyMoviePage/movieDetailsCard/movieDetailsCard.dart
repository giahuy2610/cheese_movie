import 'package:flutter/material.dart';
import './episodesListScrollView.dart';
import './actionsList.dart';

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
            Text(movie.originName + ' - ' + movie.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22, height: 1.4)),
            Text(
              'Diễn viên: ${movie.actors.toString()}',
              style: TextStyle(height: 1.4),
            ),
            Text(
              'Đạo diễn: ${movie.directors.toString()}',
              style: TextStyle(height: 1.4),
            ),
            Text(
              'Thời lượng: ${movie.time}',
              style: TextStyle(height: 1.4),
            )
          ],
        ),
        ActionsList(movie.slug),
        EpisodesListScrollView(movie.episodes),
        Text(
          'Nội dung: \n${movie.content}',
          style: TextStyle(height: 1.4),
        ),
        Row(
          children: [Text('Buy ticket')],
        )
      ],
    );
  }
}
