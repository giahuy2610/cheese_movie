import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void AddToBookmark(String slug, String episode) async {
  final ref = FirebaseDatabase.instance.ref();

  final snapshot =
      await ref.child('users/${FirebaseAuth.instance.currentUser?.uid}').get();

  if (snapshot.hasChild('${slug}')) {
    print('ton tai');
  } else {
    print('chua ton tai');
    snapshot.ref.push().set({slug: DateTime.now().millisecondsSinceEpoch});
  }
}
