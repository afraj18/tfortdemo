// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfortdemo/Screens/cart/cartScreen.dart';
import 'package:tfortdemo/Screens/home/HSComponents/DiscountBanner.dart';
import 'package:tfortdemo/Screens/home/HSComponents/HomeHeader.dart';
import 'package:tfortdemo/Screens/home/HSComponents/NavBarButtons.dart';
import 'package:tfortdemo/Screens/home/HSComponents/categories.dart';
import 'package:tfortdemo/Screens/home/HSComponents/searchField.dart';
import 'package:tfortdemo/Screens/home/HSComponents/sectionTitle.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            HomeHeader(),
            SizedBox(
              height: 20,
            ),
            DiscountBanner(
              text1: "First Purchase Offer",
              text2: "Cash Discount 50%",
            ),
            SizedBox(
              height: 20,
            ),
            Categories(),
            SizedBox(
              height: 10,
            ),
            SectionTitle(
              text: "Special for you",
              press: () {},
            ),
            SizedBox(
              width: getProportionateScreenWidth(242),
              height: getProportionateScreenWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/product1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
