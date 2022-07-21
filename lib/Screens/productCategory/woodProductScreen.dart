// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/size_confiq.dart';

import 'components/CaterProductCard.dart';

class WoodProducts extends StatelessWidget {
  const WoodProducts({Key? key}) : super(key: key);
  final String title = "Wood Products";
  @override
  Widget build(BuildContext context) {
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
            stream:
                FirebaseFirestore.instance.collection("products").snapshots(),
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
