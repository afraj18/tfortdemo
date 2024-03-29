// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/controller/wishlist_controller.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';
import 'package:tfortdemo/utills/constants.dart';

class WishListItem extends StatelessWidget {
  // final CartController controller;

  final QueryDocumentSnapshot wishList;
  final int index;

  WishListItem(
      {Key? key,
      // required this.cart,
      // required this.controller,
      required this.wishList,
      required this.index})
      : super(key: key);
  // final Cart cart;
  @override
  Widget build(BuildContext context) {
    CartController controller;
    var kPrimaryColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                    // cart.product.images[0],
                    wishList['img']),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: getProportionateScreenWidth(200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // cart.product.title,
                  "${wishList['title']}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: "\$${wishList['price']}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: hexStringToColor("#5b8c2a"),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    WishListController().deleteWishListProduct(wishList);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
