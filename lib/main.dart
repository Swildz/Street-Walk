import 'package:application_street_walk/pages/home_page.dart';
import 'package:application_street_walk/pages/splash_page.dart';
import 'package:application_street_walk/shared/style_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Street App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: textTheme,
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
