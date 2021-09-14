import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme.of(context).textTheme),
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBluishColor,
        accentColor: darkBluishColor,
        primarySwatch: Colors.deepPurple,
        //fontFamily: GoogleFonts.lato().fontFamily,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        cardColor: Colors.black,
        accentColor: Colors.white,
        canvasColor: dark,
        buttonColor: lightBluishColor,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
        ),
      );
//Colors
  static Color creamColor = Colors.grey.shade100;
  static Color dark = Vx.gray700;

  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.blue500;
}
