// ignore_for_file: prefer_const_constructors, file_names, prefer_const_constructors_in_immutables, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfortdemo/Screens/details/details_screen.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/constants.dart';

class orderCard extends StatelessWidget {
  orderCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  // final ProductController productController = Get.find();
  // final cartController = Get.put(CartController());
  // final int index;
  final double width, aspectRatio;
  final DocumentSnapshot product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 75.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            product['products'],
            // productController.products[index].title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenWidth(17),
            ),
            // maxLines: 2,
          ),
          SizedBox(
            width: 60,
          ),
          Text(
            "\$ " "${product['total']}",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
        ],
      ),
    );
  }
}
