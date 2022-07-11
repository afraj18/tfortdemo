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
import 'package:tfortdemo/Screens/home/HSComponents/specialOfferCard.dart';
import 'package:tfortdemo/Screens/home/components/productCard.dart';
// import 'package:tfortdemo/models/Product.dart';
import 'package:tfortdemo/models/Product_Model.dart';
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
              height: getProportionateScreenWidth(10),
            ),
            HomeHeader(),
            SizedBox(
              height: 10,
            ),
            DiscountBanner(
              text1: "First Purchase Offer",
              text2: "Cash Discount 50%",
            ),
            SizedBox(
              height: 17.5,
            ),
            Categories(),
            SizedBox(
              height: 5,
            ),
            SectionTitle(
              text: "Special for you",
              press: () {},
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialOfferCard(
                    category: "Wood Products",
                    subTitle: "Best Quality",
                    image: "assets/images/product1.jpg",
                    press: () {},
                  ),
                  SpecialOfferCard(
                    category: "Wood Products",
                    subTitle: "Best Quality",
                    image: "assets/images/product8.jpg",
                    press: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              children: [
                SectionTitle(
                  text: "Popular Products",
                  press: () {},
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        demoProduct.length,
                        (index) => ProductCard(
                          product: demoProduct[index],
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
