import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import './modules/homePage/homePage.dart';
import './modules/homePage/bottomNavigation.dart';
import './providers/const.dart';
import './providers/controller.dart';
import 'package:provider/provider.dart';
import './modules/categoryPage/categoryPage.dart';
import './modules/categoryPage/filterByCategoryPage/filteredByCategoryPage.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: MaterialApp(
          theme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var temp;
  var currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Image.asset('assets/main_logo.png'), //Main logo
        title: const Text(
          "Cheese Movie",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: temp,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Feed"),
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
                temp = FilteredByCategoryPage();
              });
              break;
            case 1:
              setState(() {
                temp = CategoryPage();
              });
              ;
            // case 2:;
            // case 2:;
          }
        },
      ),
    );
  }
}
