import 'package:flutter/material.dart';
import 'package:flutter_begin/home_page.dart';
import 'package:flutter_begin/login_page.dart';
import 'package:flutter_begin/util/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: "/home",
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute:(context)=> LoginPage()
      },

    );
  }

}


