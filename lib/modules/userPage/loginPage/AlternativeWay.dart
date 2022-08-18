import 'package:flutter/material.dart';

class AlternativeWay extends StatelessWidget {
  const AlternativeWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('OR'),
          Row(
            children: [Container(), Container()],
          )
        ],
      ),
    );
  }
}
