import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../providers/const.dart';

class UserInfoCard extends StatefulWidget {
  const UserInfoCard({Key? key}) : super(key: key);

  @override
  State<UserInfoCard> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(400),
            child: Image.network(
              FirebaseAuth.instance.currentUser!.photoURL ??
                  'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',
              width: Const.screenWidth / 3,
              height: Const.screenWidth / 3,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              // Text(FirebaseAuth.instance.currentUser!.displayName ??
              //     FirebaseAuth.instance.currentUser!.email.toString()),
              Text(FirebaseAuth.instance.currentUser!.email.toString())
            ],
          )
        ],
      ),
    );
  }
}
