import 'package:cheese_movie/modules/notificationPage/notificationPage.dart';
import 'package:flutter/material.dart';
import './modules/homePage/homePage.dart';
import './providers/controller.dart';
import 'package:provider/provider.dart';
import './modules/categoryPage/categoryPage.dart';
import './modules/bookmarkPage/bookmarkPage.dart';
import './modules/userPage/userPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import './common/customSearchDelegate/customSearchDelegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            // primarySwatch: Colors.lightBlueAccent!,
            primaryColor: Colors.blue[300],
            backgroundColor: Colors.blue[100],

            brightness: Brightness.light,
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 0, backgroundColor: Colors.transparent),
            primarySwatch: Colors.amber,
            primaryColor: Colors.black87,
            drawerTheme: const DrawerThemeData(backgroundColor: Colors.black54),
            brightness: Brightness.dark,
            backgroundColor: const Color.fromRGBO(17, 24, 39, 1),
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var temp;
  var currentPageIndex = 0;
  var isLogin = false;

  Future<void> initializeDefault() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('users/${FirebaseAuth.instance.currentUser?.uid}')
        .get();

    if (snapshot.exists) {
      List<String> tempListOfMovies = List<String>.empty(growable: true);
      snapshot.children.forEach((element) {
        tempListOfMovies.add(element.children.first.key.toString());
      });

      context.read<Controller>().setBookmarkSlug(tempListOfMovies);
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDefault();
    temp == null ? temp = HomePage() : 1;
    return Scaffold(
      appBar: AppBar(
        //shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Image.asset('assets/images/main_logo.png'),
        ), //Main logo
        title: const Text(
          "Cheese Movie",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CustomSearchDelegate()));
              },
              icon: Icon(Icons.search_rounded)),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NotificationPage()));
            },
            icon: Icon(Icons.notifications),
          )
        ],
      ),
      body: temp,
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home_rounded),
              label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmark"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Account"),
        ],
        currentIndex: currentPageIndex,
        fixedColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 20),
        onTap: (index) {
          currentPageIndex = index;
          print(index);
          switch (index) {
            case 0:
              setState(() {
                temp = HomePage();
              });
              break;
            case 1:
              setState(() {
                temp = CategoryPage();
              });
              break;
            case 2:
              setState(() {
                temp = BookmarkPage();
              });
              break;
            case 3:
              setState(() {
                temp = UserPage();
              });
          }
        },
      ),
    );
  }
}
