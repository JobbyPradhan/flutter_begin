import 'package:flutter/material.dart';
import 'package:flutter_begin/pages/cart_page.dart';
import 'package:flutter_begin/pages/home_page.dart';
import 'package:flutter_begin/pages/login_page.dart';
import 'package:flutter_begin/util/routes.dart';
import 'package:flutter_begin/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute:(context)=> LoginPage(),
        MyRoutes.cartRoute:(context)=> CartPage(),
      },

    );
  }

}


