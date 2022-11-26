import 'dart:async';

import 'package:application_street_walk/pages/home_page.dart';
import 'package:application_street_walk/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const LoginPage()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var ukuran = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: ukuran.width,
          height: ukuran.height,
          color: Colors.white,
          // decoration: BoxDecoration(
          //   color: Colors.green[200],
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/sry.png'),
                radius: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const CircularProgressIndicator(),
              Text(
                'Wall Street Jurnal',
                style: GoogleFonts.lato(fontSize: 20),
              )
              // CircularProgressIndicator(),
              // SizedBox(height: 10),
              // Text('Loading ..')
            ],
          ),
        ),
      ),
    );
  }
}
