import 'package:cheese_movie/modules/userPage/loginPage/AlternativeWay.dart';
import 'package:flutter/material.dart';
import './inputFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CloseButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              InputFields(),
              TextButton(
                onPressed: () {},
                child: Text('Login'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.red)),
              ),
              AlternativeWay(),
              Text("Dont't have an acoount? Register")
            ],
          ),
        ));
  }
}
