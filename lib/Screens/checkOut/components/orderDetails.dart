// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use, void_checks, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfortdemo/Screens/checkOut/checkOutScreen.dart';
import 'package:tfortdemo/constants/firebase.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';
import 'package:tfortdemo/utills/constants.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    String uid = user!.uid;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      height: 120,
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
                // Container(
                //   padding: EdgeInsets.all(10),
                //   height: getProportionateScreenHeight(50),
                //   width: getProportionateScreenWidth(40),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFF5F6F9),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: SvgPicture.asset(
                //     "assets/icons/receipt.svg",
                //     color: hexStringToColor("#5b8c2a"),
                //   ),
                // ),
                // Spacer(),
                // Text("PayHere"),
                // const SizedBox(
                //   width: 10,
                // ),
                // Icon(
                //   Icons.arrow_forward_ios,
                //   size: 12,
                //   color: kTextColor,
                // ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
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
                            text: "Total\n",
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              TextSpan(
                                  text:
                                      "\$ ${snapshot.data!.data()!['subTotal'].toString()}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  )),
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
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ));
                    },
                    color: hexStringToColor("#5b8c2a"),
                    child: Text(
                      "Pay Here",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
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
