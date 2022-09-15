// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use, void_checks, await_only_futures, unused_import, use_key_in_widget_constructors, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfortdemo/Screens/cart/cartScreen.dart';
import 'package:tfortdemo/Screens/checkOut/checkOutScreen.dart';
import 'package:tfortdemo/Screens/checkOut/components/cardForm.dart';
import 'package:tfortdemo/constants/firebase.dart';
import 'package:tfortdemo/controller/checkout_controller.dart';
import 'package:tfortdemo/services/database.dart';

import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';
import 'package:tfortdemo/utills/constants.dart';

class orderDetails extends StatelessWidget {
  orderDetails(
    TextEditingController nameController,
  );

  @override
  Widget build(BuildContext context) {
    String subTotal;

    User? user = auth.currentUser;
    String uid = user!.uid;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      height: 160,
      // color: Colors.amber,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.45),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "PayHere",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: FirebaseFirestore.instance
                        .collection('cartSubTotal')
                        .doc(uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text.rich(
                          TextSpan(
                            text: "Sub Total\n",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              TextSpan(
                                text:
                                    "\$ ${snapshot.data!.data()!['subTotal'].toString()}",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                        // Text("\$ ${snapshot.data!.data()!['subTotal']}");
                      }
                      return const Text("Loading");
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenWidth(40),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ));
                      checkoutControl().addToOrder(
                        user.uid,
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => cardForm()));
                    },
                    color: hexStringToColor("#5b8c2a"),
                    child: Text(
                      "Confirm Order",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(17.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
