// ignore_for_file: file_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/splash/components/bodySplach.dart';
import 'package:tfortdemo/size_confiq.dart';

class splash_Screen extends StatelessWidget {
  const splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
