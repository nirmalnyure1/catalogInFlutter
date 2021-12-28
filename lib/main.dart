import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cartPage.dart';
import 'package:catalog_app/pages/homeDetail.dart';
import 'package:catalog_app/pages/homepage.dart';
import 'package:catalog_app/pages/loginpage.dart';
import 'package:catalog_app/utils/route.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  //for
  setPathUrlStrategy();
  runApp(
    VxState(store: MyStore(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.homeDetailRoute: (uri, params) {
          final catalog = (VxState.store as MyStore)
              .catalogModel
              .getById(int.parse(uri.queryParameters["id"]!));
          // .getById(int.parse(uri.queryParameters!["id"]));
          return MaterialPage(
              child: HomeDetailPage(
            catalog: params,
          ));
        },
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.cartPageRoute: (_, __) => MaterialPage(child: CartPage()),
      }),
      // initialRoute: '/login',
      // routes: {
      //   "/": (context) => LoginPage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.cartPageRoute: (context) => CartPage(),
      // },
    );

    // return MaterialApp.router(routeInformationParser: VxInformationParser(), routerDelegate: VxNavigator(routes: {

    // }));
  }
}
