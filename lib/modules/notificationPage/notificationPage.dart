import 'package:flutter/material.dart';
import '../../providers/const.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Thông báo'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: BackButton(),
        ),
        body: Container(
            //padding: EdgeInsets.all(20),
            width: Const.screenWidth,
            height: Const.screenHeight,
            alignment: Alignment.center,
            child: Text('Không có thông báo')));
  }
}
