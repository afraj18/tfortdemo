// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tfortdemo/Screens/AboutUs/aboutUs.dart';
import 'package:tfortdemo/Screens/cart/cartScreen.dart';
import 'package:tfortdemo/Screens/wishlist/wishlistScreen.dart';

// import 'package:tfortdemo/Screens/wishlist/wishlistScreen.dart';
import 'package:tfortdemo/size_confiq.dart';

class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/Heart Icon_2.svg",
        "text": "WishList",
        "press": WishListScreen()
      },
      {
        "icon": "assets/icons/Cart_2.svg",
        "text": "Cart",
        "press": CartScreen(),
      },
      {
        "icon": "assets/icons/Avatar.svg",
        "text": "Profile",
        "press": null,
      },
      {
        "icon": "assets/icons/about_us.svg",
        "text": "About Us",
        "press": AboutUs(),
      },
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => categories[index]['press'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    this.icon,
    this.text,
    required this.press,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(50),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFF5b8c2a).withOpacity(.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(
                  icon,
                  color: Color(0xFF5b8c2a),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
