// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/size_confiq.dart';

import 'components/CaterProductCard.dart';

class WoodProducts extends StatelessWidget {
  // final ProductController productController = Get.put(ProductController());
  WoodProducts({
    Key? key,
    // required this.index,
  }) : super(key: key);

  final String title = "Upcylced Wood Products";

  // final cartController = Get.find();
  // final int index;

  @override
  Widget build(BuildContext context) {
    final catRef = FirebaseFirestore.instance.collection("products");
    final query = catRef.where("category", isEqualTo: "wood").snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(22.5),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 8),
        child: StreamBuilder<QuerySnapshot>(
            stream: query,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CaterProductCard(product: productSnap),
                              SizedBox(
                                height: 100,
                              )
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
    );
  }
}
