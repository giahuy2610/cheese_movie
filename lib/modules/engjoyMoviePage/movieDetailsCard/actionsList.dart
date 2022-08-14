import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ActionsList extends StatelessWidget {
  const ActionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlassmorphicContainer(
              width: 40,
              height: 40,
              borderRadius: 10,
              linearGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              border: 0,
              blur: 20,
              borderGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(Icons.thumb_up_outlined),
                    onTap: () {},
                  ))),
          GlassmorphicContainer(
              width: 40,
              height: 40,
              borderRadius: 10,
              linearGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              border: 0,
              blur: 20,
              borderGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(Icons.thumb_down_alt_outlined),
                    onTap: () {},
                  ))),
          GlassmorphicContainer(
              width: 40,
              height: 40,
              borderRadius: 10,
              linearGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              border: 0,
              blur: 20,
              borderGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(Icons.mode_comment_outlined),
                    onTap: () {},
                  ))),
          GlassmorphicContainer(
              width: 40,
              height: 40,
              borderRadius: 10,
              linearGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              border: 0,
              blur: 20,
              borderGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(Icons.share),
                    onTap: () {},
                  ))),
          GlassmorphicContainer(
              width: 40,
              height: 40,
              borderRadius: 10,
              linearGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              border: 0,
              blur: 20,
              borderGradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.15),
                    Color(0xFFFFFFFF).withOpacity(0.08),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(Icons.error_outline_outlined),
                    onTap: () {},
                  )))
        ],
      ),
    );
  }
}
