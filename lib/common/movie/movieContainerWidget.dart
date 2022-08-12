import 'package:flutter/material.dart';

class MovieContainerWidget extends StatefulWidget {
  const MovieContainerWidget({Key? key}) : super(key: key);

  @override
  State<MovieContainerWidget> createState() => _MovieContainerWidgetState();
}

class _MovieContainerWidgetState extends State<MovieContainerWidget> {
  final ScrollController _sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 50),
      child: SingleChildScrollView(
          controller: _sc,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [],
          )),
    );
  }
}
