import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/controller.dart';

void register(BuildContext context, String emailAdress, String password) async {
  try {
    final auth = FirebaseAuth.instance;

    final authDo = await auth.createUserWithEmailAndPassword(
        email: emailAdress, password: password);

    //auto create realtime database slot for this new user
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users');
    snapshot.ref.push().set(auth.currentUser?.uid.toString());

    context.read<Controller>().setLogIn(true);
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    print('bi loi');
    print(e);
  }
}
