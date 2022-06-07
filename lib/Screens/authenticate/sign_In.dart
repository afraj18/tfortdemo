// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: hexStringToColor("#5b8c2a"),
        elevation: 5,
        title: Text("Sign In"),
      ),
      body: Form(
        child: Column(),
      ),
    );
  }
}
