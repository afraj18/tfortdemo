// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tfortdemo/Screens/cart/components/cartItemCart.dart';
import 'package:tfortdemo/constants/firebase.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/size_confiq.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final CartController controller = Get.find();
  // Stream collectionRef =
  //     FirebaseFirestore.instance.collection('products').snapshots();

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("cart")
              .where('id', isEqualTo: uid)
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: Text(
                      "Oops something went wrong",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  )
                : ListView.builder(
                    // itemCount: demoCarts.length,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: CartItemCard(
                          // cart: snapshot.data!.docs![index],
                          // controller: controller,
                          cart: snapshot.data!.docs[index],
                          quantity: 1,
                          index: index,
                        ),
                      );
                    });
          }),
    );
  }
}
