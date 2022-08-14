import 'package:flutter/material.dart';
import './modules/homePage/homePage.dart';
import './providers/controller.dart';
import 'package:provider/provider.dart';
import './modules/categoryPage/categoryPage.dart';
import './modules/bookmarkPage/bookmarkPage.dart';
import './modules/userPage/userPage.dart';
import './modules/userPage/loginPage/loginPage.dart';


void main() {
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
            appBarTheme:
                AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 0, backgroundColor: Colors.transparent),
            primarySwatch: Colors.amber,
            primaryColor: Colors.black87,
            drawerTheme: DrawerThemeData(backgroundColor: Colors.black54),
            brightness: Brightness.dark,
            backgroundColor: Color.fromRGBO(17, 24, 39, 1),
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

  @override
  Widget build(BuildContext context) {
    temp == null ? temp = HomePage() : 1;
    return Scaffold(
      appBar: AppBar(
        //shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Image.asset('assets/images/main_logo.png'), //Main logo
        title: const Text(
          "Cheese Movie",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
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
              if (!isLogin)
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              else
                setState(() {
                  temp = UserPage();
                });
              ;
          }
        },
      ),
    );
  }
}
