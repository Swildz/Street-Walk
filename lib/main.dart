import 'package:application_street_walk/pages/history_page.dart';
import 'package:application_street_walk/pages/home_page.dart';
import 'package:application_street_walk/pages/login_page.dart';
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
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        // SplashPage.routeName: (context) => const SplashPage(),
        // ignore: equal_keys_in_map
        // LoginPage.routeName: (context) => const LoginPage(),
        // ignore: equal_keys_in_map
        HomePage.routeName: (context) => const HomePage(),
        HistoryPage.routName: (context) => const HistoryPage(),
        //ignore: equal_keys_in_map
        // DetailPage.routeName: (context) => DetailPage(
        //       articles: ModalRoute.of(context)!.settings.arguments as Articles,
        //     ),
        // ignore: equal_keys_in_map
        // ArticleWeb.routeName: (context) => ArticleWeb(
        //       url: ModalRoute.of(context)?.settings.arguments as String,
        //     )
      },
    );
  }
}
