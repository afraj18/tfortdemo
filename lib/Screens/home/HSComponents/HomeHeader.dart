// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/home/HSComponents/NavBarButtons.dart';
import 'package:tfortdemo/Screens/home/HSComponents/searchField.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/size_confiq.dart';

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
            icon: Icon(Icons.shopping_cart_outlined),
            press: () {},
          ),
          NavBarButton(
            icon: Icon(Icons.person_outlined),
            press: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
