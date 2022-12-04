import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fovoutrit extends StatefulWidget {
  const fovoutrit({super.key});

  static const routName = '/favorit';

  @override
  State<fovoutrit> createState() => _fovoutritState();
}

class _fovoutritState extends State<fovoutrit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Hasil Favourit"),
      ),
    );
  }
}
