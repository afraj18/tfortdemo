// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(25),
        vertical: getProportionateScreenWidth(15),
      ),
      height: 75,
      decoration: BoxDecoration(
        // color: Color(0xFF4A3298),
        color: hexStringToColor("#5b8c2a"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: text1 + "\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: text2,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
