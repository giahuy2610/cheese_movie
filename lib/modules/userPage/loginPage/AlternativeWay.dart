import 'package:flutter/material.dart';

class AlternativeWay extends StatelessWidget {
  const AlternativeWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('or log in with'),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.g_mobiledata_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bike_scooter))
            ],
          )
        ],
      ),
    );
  }
}
