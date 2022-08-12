import 'package:cheese_movie/modules/homePage/recentScrollView/recentScrollView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        RecentScrollView(),
        RecentScrollView(),
      ],
    ));
  }
}
