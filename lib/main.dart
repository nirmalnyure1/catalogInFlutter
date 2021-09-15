import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cartPage.dart';
import 'package:catalog_app/pages/loginpage.dart';
import 'package:catalog_app/utils/route.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/homepage.dart';

void main() {
  runApp(VxState(store: Store(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/home',
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartPageRoute: (context) => CartPage(),
      },
    );
  }
}
