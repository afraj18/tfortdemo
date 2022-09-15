// ignore_for_file: file_names, empty_constructor_bodies, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/AllProducts/components/productCard_all.dart';
import 'package:tfortdemo/Screens/checkOut/components/orderDetails.dart';
import 'package:tfortdemo/constants/firebase.dart';
import 'package:tfortdemo/reusable_widgets/reusable_widget.dart';

import 'components/productCard_CO.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen();

  String? id;

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;

    TextEditingController _nameController = TextEditingController();
    TextEditingController _addressController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Check Out",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              //Personal Details
              Column(
                children: [
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('t4tECom')
                        .doc(user!.uid)
                        .get(),
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      return reusableTextField(
                        data?['name'],
                        Icons.person,
                        false,
                        _nameController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('t4tECom')
                        .doc(user.uid)
                        .get(),
                    builder: (context, snapshot) {
                      final data = snapshot.data!;
                      return reusableTextField(
                        data['address'],
                        Icons.home_filled,
                        false,
                        _addressController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('t4tECom')
                        .doc(user.uid)
                        .get(),
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      return reusableTextField(
                        data!['phoneNo'],
                        Icons.phone,
                        false,
                        _phoneController,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              // ProductDetails
              Text(
                "Product Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, right: 20, bottom: 8),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('cart')
                        .where('id', isEqualTo: user.uid)
                        .snapshots(),
                    // productController.products[],
                    // FirebaseFirestore.instance.collection("products").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("No Data");
                      } else
                        // ignore: curly_braces_in_flow_control_structures
                        return SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              ...List.generate(
                                // demoProduct.length,
                                snapshot.data!.docs.length,
                                // productController.products.length,
                                // 2,
                                (index) {
                                  DocumentSnapshot productSnap =
                                      snapshot.data!.docs[index];
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProductCard_CO(product: productSnap),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              // SizedBox(
                              //   width: getProportionateScreenWidth(30),
                              // )
                            ],
                          ),
                        );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: orderDetails(_nameController),
    );
  }
}
