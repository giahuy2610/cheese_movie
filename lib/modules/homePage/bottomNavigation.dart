import 'package:flutter/material.dart';
import './bottomNavigationItem.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [],
      // child: Row(
      //   children: const [
      //     BottomNavigationItem(Icon(Icons.abc),'Feed'),
      //     BottomNavigationItem(Icon(Icons.menu),'Categories'),
      //     BottomNavigationItem(Icon(Icons.bookmark),'Bookmark'),
      //     BottomNavigationItem(Icon(Icons.account_circle_outlined),'Accout'),
      //   ],
      // ),
    );
  }
}
