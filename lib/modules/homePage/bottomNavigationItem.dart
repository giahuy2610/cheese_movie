import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final icon;
  final text;

  const BottomNavigationItem(this.icon, this.text, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationItem(icon, text);
  }
}
