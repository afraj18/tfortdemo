// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/cart/cartScreen.dart';
// import 'package:tfortdemo/Screens/home/HSComponents/NavBarButtons.dart';
// import 'package:tfortdemo/Screens/home/HSComponents/searchField.dart';
import 'package:tfortdemo/Screens/home/components/NavBarButtons.dart';
import 'package:tfortdemo/Screens/home/components/searchField.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key? key,
  }) : super(key: key);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(
            hintText: "Search Products",
          ),
          NavBarButton(
            icon: Icon(
              Icons.feedback_outlined,
              // color: hexStringToColor("#5b8c2a"),
              // size: 30,
            ),
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          NavBarButton(
            icon: Icon(
              Icons.logout,
              // color: hexStringToColor("#5b8c2a"),
            ),
            press: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
