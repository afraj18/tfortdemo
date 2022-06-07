// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/signInScreen.dart';
import 'package:tfortdemo/Screens/signUpScreen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(toggleView: toggleView);
    } else {
      return SignUpScreen(toggleView: toggleView);
    }
    // return Container(
    //   child: SignInScreen(),
    // );
  }
}
