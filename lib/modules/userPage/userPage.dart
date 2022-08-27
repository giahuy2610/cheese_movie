import 'package:cheese_movie/modules/userPage/myMovies/myMovies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/const.dart';
import '../../providers/controller.dart';
import 'loginPage/loginPage.dart';
import './userInfo/userInfo.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser?.uid);
    return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(maxHeight: Const.screenHeight),
        child: context.select<Controller, bool>((e) => e.isLogin)
            ? Column(
                children: [
                  Expanded(
                    child: UserInfoCard(),
                  ),
                  MyMovies(),
                ],
              )
            : TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white24),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text('Đăng nhập để tiếp tục')));
  }
}
