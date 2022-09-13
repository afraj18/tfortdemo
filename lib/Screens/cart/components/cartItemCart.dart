// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';
import 'package:tfortdemo/utills/constants.dart';

class CartItemCard extends StatelessWidget {
  // final CartController controller;

  final QueryDocumentSnapshot cart;
  int quantity;
  final int index;

  CartItemCard(
      {Key? key,
      // required this.cart,
      // required this.controller,
      required this.cart,
      required this.quantity,
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
                    cart['img']),
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
                  "${cart['title']}",
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
                    text: "\$${cart['price']}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: hexStringToColor("#5b8c2a"),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // controller.addProduct(product);
                      },
                      icon: Icon(
                        Icons.remove_circle_outline_rounded,
                        size: 20,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: " ${cart['qty']}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // controller.addProduct(product);
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // print('Item Deleted');
                    // controller.removeProduct(product);
                    // CartController.deleteCartProduct(cart);
                    CartController().deleteCartProduct(cart);
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
