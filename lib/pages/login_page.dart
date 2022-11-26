import 'package:application_street_walk/data/models/street_model.dart';
import 'package:application_street_walk/pages/home_page.dart';
import 'package:application_street_walk/shared/style_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginPage';
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/sry.png'),
              const SizedBox(
                height: 1,
              ),
              // const Padding(
              //   padding: EdgeInsets.only(right: 30),
              //   child: Text(
              //     'Sign in now, and find new journal',
              //     style: TextStyle(fontSize: 15, color: Colors.black),
              //   ),
              // ),
              const SizedBox(
                height: 1,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide:
                        const BorderSide(width: 3.5, color: Colors.black12),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black12),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black12),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  labelText: 'Username',
                  hintText: 'Username',
                  labelStyle: const TextStyle(
                    fontFamily: 'poppins',
                    color: Color(969696),
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
                    borderRadius: BorderRadius.circular(21),
                    borderSide:
                        const BorderSide(width: 3.5, color: Colors.black12),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black12),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black12),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  labelText: 'Password',
                  hintText: 'Password',
                  labelStyle: const TextStyle(
                      fontFamily: 'poppins', color: Color(969696)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: bool.fromEnvironment('login'),
                    onChanged: (bool? newValue) {
                      setState(() {});
                    },
                  ),
                  Text('Keep me logged in'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Forget Password');
                    },
                    child: const Text(
                      'Forgot Your Password?',
                      style: TextStyle(color: Colors.red, fontSize: 12.0),
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
                  color: Color.fromARGB(255, 13, 111, 209),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   width: double.infinity,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   //color: Colors.black12,
              //   child: MaterialButton(
              //     onPressed: () =>
              //         Navigator.pushNamed(context, HomePage.routeName),
              //     color: Colors.black12,
              //     child: const Text(
              //       'Create Account',
              //       style: TextStyle(fontSize: 17, color: Colors.black),
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 110, 110, 110)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "   Sign up here!",
                        style:
                            TextStyle(color: Color.fromARGB(255, 92, 135, 221)),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Divider(
                        thickness: 0.5,
                        height: 80,
                        color: Colors.red,
                        indent: 50,
                        endIndent: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('OR CONNECT WITH'),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(100, 5, 5, 5),
                      child: Image.asset('assets/google.png')),
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Image.asset('assets/facebook.png'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
