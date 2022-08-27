import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../modules/homePage/continuteWatchingScrollView/watchingMoviePage.dart';
import '../../../modules/bookmarkPage/bookmarkPage.dart';
import '../../../providers/const.dart';
import '../../../providers/controller.dart';

class MyMovies extends StatefulWidget {
  const MyMovies({Key? key}) : super(key: key);

  @override
  State<MyMovies> createState() => _MyMoviesState();
}

class _MyMoviesState extends State<MyMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            // ListTile(
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(builder: (_) => WatchingMoviePage(watchingList)));
            //   },
            //   title: Text('Phim đang xem'),
            //   leading: Icon(Icons.favorite),
            //   trailing: ClipRRect(
            //     borderRadius: BorderRadius.circular(1255555),
            //     child: Text(
            //       '1',
            //       style: TextStyle(backgroundColor: Colors.cyan),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (_) => BookmarkPage()));
            //   },
            //   title: Text('Yêu thích'),
            //   leading: Icon(Icons.favorite),
            //   trailing: ClipRRect(
            //     borderRadius: BorderRadius.circular(1255555),
            //     child: Text(
            //       '1',
            //       style: TextStyle(backgroundColor: Colors.cyan),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   onTap: () {},
            //   title: Text('Phim chờ chiếu'),
            //   leading: Icon(Icons.favorite),
            //   trailing: ClipRRect(
            //     borderRadius: BorderRadius.circular(1255555),
            //     child: Text(
            //       '1',
            //       style: TextStyle(backgroundColor: Colors.cyan),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   onTap: () {},
            //   title: Text('Cài đặt'),
            //   leading: Icon(Icons.favorite),
            //   trailing: ClipRRect(
            //     borderRadius: BorderRadius.circular(1255555),
            //     child: Text(
            //       '1',
            //       style: TextStyle(backgroundColor: Colors.cyan),
            //     ),
            //   ),
            // ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
                context.read<Controller>().setLogIn(false);
              },
              title: Text('Đăng xuất'),
              leading: Icon(Icons.logout),
            ),
          ],
        ));
  }
}
