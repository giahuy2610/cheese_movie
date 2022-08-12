import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../providers/const.dart';

class CategoryButton extends StatelessWidget {
  final text;
  final path;
  const CategoryButton(this.text, String this.path, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            borderRadius: BorderRadius.circular(10)),
        width: Const.screenWidth * 0.4,
        height: 80,
        child: InkWell(
            onTap: () {
              print(path);
              //Navigator.push(context, MaterialPageRoute(builder: builder))
            },
            child: Container(
              child: Text(this.text),
              alignment: Alignment.center,
            )));
  }
}
