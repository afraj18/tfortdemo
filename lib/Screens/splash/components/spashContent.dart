// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "UPCYCLER'S LAB",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            color: hexStringToColor("#5b8c2a"),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: getProportionateScreenWidth(20)),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/images/t4tLogo.png",
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(265),
        )
      ],
    );
  }
}
