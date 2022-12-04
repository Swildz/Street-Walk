import 'package:application_street_walk/pages/home_page.dart';
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

  final TextEditingController _user = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/sry.png'),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
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
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    labelText: 'Username',
                    hintText: 'Username',
                    labelStyle: const TextStyle(
                      fontFamily: 'poppins',
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Color(969696),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 3.5, color: Colors.black12),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black12),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black12),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    labelText: 'Password',
                    hintText: 'Password',
                    labelStyle: const TextStyle(
                        fontFamily: 'poppins', color: Color(969696)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: const bool.fromEnvironment('login'),
                    onChanged: (bool? newValue) {
                      setState(() {});
                    },
                  ),
                  const Text('Keep me logged in'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      // ignore: avoid_print
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
                  color: const Color.fromARGB(255, 13, 111, 209),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 110, 110, 110)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "   Sign up here!",
                        style:
                            TextStyle(color: Color.fromARGB(255, 92, 135, 221)),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      Divider(
                        thickness: 0.5,
                        height: 10,
                        color: Colors.red,
                        indent: 50,
                        endIndent: 40,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        color: Colors.white,
                        child: Text(
                          'OR CONNECTION WITH',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(100, 5, 5, 5),
                      child: Image.asset('assets/google.png')),
                  Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
