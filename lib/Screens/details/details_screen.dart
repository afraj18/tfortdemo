// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfortdemo/constants/firebase.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/controller/wishlist_controller.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

import 'components/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.product}) : super(key: key);

  final DocumentSnapshot product;
  // final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return Scaffold(
      // backgroundColor: product.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              WishListController().addToWishList(
                uid,
                product['title'],
                product['img'],
                product['price'],
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Added to the WishList",
                    style: TextStyle(
                        // color: Colors.black,
                        ),
                  ),
                  // backgroundColor: hexStringToColor("#5b8c2a"),
                ),
              );
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(
            product["img"],
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product["title"],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$ " + product['price'].toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      product['description'],
                    ),
                  ),
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Row(
                    children: const [
                      ColorDot(
                        color: Color(0xFFBEE8EA),
                        isActive: false,
                      ),
                      ColorDot(
                        color: Color(0xFF141B4A),
                        isActive: true,
                      ),
                      ColorDot(
                        color: Color(0xFFF4E5C3),
                        isActive: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // _cartController.addProduct();
                          // _cartController.addProduct(product.id, product);
                          CartController().setTotal(uid, product['price']);
                          // print(CartController().getTotal());
                          CartController().addToCart(
                            uid,
                            product['title'],
                            product['img'],
                            product['price'],
                            '1',
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Added to the cart",
                                style: TextStyle(
                                    // color: Colors.black,
                                    ),
                              ),
                              // backgroundColor: hexStringToColor("#5b8c2a"),
                            ),
                          );
                          Navigator.pop(context);
                          // showDialog(
                          //   context: context,
                          //   builder: (_) => AlertDialog(
                          //     title: Text('Successfull'),
                          //     content: Text(
                          //       'Added to the cart',
                          //     ),
                          //     actions: [
                          //       Center(
                          //         child: TextButton(
                          //           style: TextButton.styleFrom(
                          //             primary: Colors.white,
                          //             backgroundColor:
                          //                 Colors.green[900], // Background Color
                          //           ),
                          //           onPressed: () =>
                          //               Navigator.pop(context, 'Okay'),
                          //           child: const Text('Ok'),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // );
                          // print(product.data());
                          // Get.snackbar(
                          //   "Added",
                          //   "Item has been added.",
                          //   snackPosition: SnackPosition.TOP,
                          //   duration: Duration(seconds: 2),
                          // );
                          // print(product.id);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: hexStringToColor("#5b8c2a"),
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
