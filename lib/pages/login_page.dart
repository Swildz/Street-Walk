import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/home_page.dart';
import 'package:application_street_walk/shared/style_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/';
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('ass'),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  'Sign in now, and find new journal',
                  style: TextStyle(fontSize: 15, color: Colors.amber),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 3, color: primaryColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: primaryColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: primaryColor),
                  ),
                  labelText: 'Type your email or user name',
                  labelStyle: const TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 3, color: primaryColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: primaryColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: primaryColor),
                  ),
                  labelText: 'Type your password',
                  labelStyle: const TextStyle(
                      fontFamily: 'poppins', color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Forget Password');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.amber, fontSize: 12.0),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: MaterialButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, HomePage.routeName),
                  color: Colors.black12,
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                //color: Colors.black12,
                child: MaterialButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, HomePage.routeName),
                  color: Colors.black12,
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
