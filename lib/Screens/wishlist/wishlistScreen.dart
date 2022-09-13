// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_import, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tfortdemo/Screens/cart/components/checkOutCard.dart';
import 'package:tfortdemo/Screens/wishlist/components/body.dart';
import 'package:tfortdemo/models/cart.dart';
import 'package:tfortdemo/services/firestoreDB.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: CheckOutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Wish List",
            style: TextStyle(color: Colors.black),
          ),
          // Text(
          //   // "${demoCarts.length} Items",
          //   "",
          //   style: Theme.of(context).textTheme.caption,
          // )
        ],
      ),
      centerTitle: true,
    );
  }
}
