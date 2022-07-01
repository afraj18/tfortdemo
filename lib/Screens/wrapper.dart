// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfortdemo/Screens/home/home.dart';
import 'package:tfortdemo/Screens/home/home_Screen.dart';
// import 'package:tfortdemo/Screens/splash/splashScreen.dart';

import 'package:tfortdemo/models/user.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      // return Home();
      return Home_Screen();
      // return splash_Screen();
    }
  }
}
