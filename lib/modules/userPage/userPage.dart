import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/controller.dart';
import 'loginPage/loginPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: context.select<Controller, bool>((e) => e.isLogin)
            ? TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white24),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  context.read<Controller>().setLogIn(false);
                },
                child: Text('Đăng xuất'))
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
