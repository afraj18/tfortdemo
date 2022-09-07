// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/constants.dart';

class CartItemCard extends StatelessWidget {
  final CartController controller;
  final QueryDocumentSnapshot product;
  int quantity;
  final int index;

  CartItemCard(
      {Key? key,
      // required this.cart,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);
  // final Cart cart;
  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                    // cart.product.images[0],
                    product['image'][0]),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // cart.product.title,
                  product['title'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                      text: "\$ ${product['price']}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                      children: [
                        TextSpan(
                          // text: " x${cart.numOfItem}",
                          style: TextStyle(color: kTextColor),
                        )
                      ]),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // controller.removeProduct(product);
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                    Text("${quantity}"),
                    IconButton(
                      onPressed: () {
                        quantity = quantity + 1;
                        // controller.addProduct(product);
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
