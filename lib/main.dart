import 'package:catalog_app/pages/loginpage.dart';
import 'package:flutter/material.dart';

import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/home',
      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
