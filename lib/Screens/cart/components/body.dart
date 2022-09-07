// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tfortdemo/Screens/cart/components/cartItemCart.dart';
import 'package:tfortdemo/controller/cart_controller.dart';
import 'package:tfortdemo/size_confiq.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CartController controller = Get.find();
  Stream collectionRef =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("products").snapshots(),
          builder: (context, snapshot) {
            return controller.products.length == 0
                ? Center(
                    child: Text(
                      "No Item added to the Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  )
                : Obx(
                    () => ListView.builder(
                      // itemCount: demoCarts.length,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: CartItemCard(
                          // cart: snapshot.data!.docs![index],
                          controller: controller,
                          product: snapshot.data!.docs[index],
                          quantity: controller.products.values.toList()[index],
                          index: index,
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
