import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepOrange,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
    /*  buttonColor: darkBluishColor,
      accentColor: Colors.black,*/
      colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.black,
          onPrimary: darkBluishColor,
          onSurface: Colors.black),
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    //  brightness: Brightness.dark,
   //   brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
    //  buttonColor: lightBluishColor, // onPrimary
      canvasColor: darkCreamColor,
      colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.black,
      onPrimary: lightBluishColor,onSurface: Colors.white),
      //brightness: Brightness.dark),
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
      ));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
