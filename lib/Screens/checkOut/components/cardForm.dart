// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tfortdemo/Screens/home/home_Screen.dart';
import 'package:tfortdemo/constants/firebase.dart';

import '../../../size_confiq.dart';
import 'orderCard.dart';

class cardForm extends StatelessWidget {
  cardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_Screen(),
                    ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[900]),
              ),
              child: Icon(Icons.home_filled),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Orders")
                  .where('id', isEqualTo: user!.uid)
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
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 370,
                          color: Colors.red[100],
                          child: Text(
                            "Dear Customer, Thank you for purchasing our upcycled product. Keep purchasing for more benefits.",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Times new roman",
                              letterSpacing: 3,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your Orders",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.green[300],
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Products",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getProportionateScreenWidth(20),
                                ),
                              ),
                              Text(
                                "Total ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: getProportionateScreenWidth(20),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          // demoProduct.length,
                          snapshot.data!.docs.length,
                          // productController.products.length,
                          // 2,
                          (index) {
                            DocumentSnapshot orderSnap =
                                snapshot.data!.docs[index];
                            return Container(
                              // padding: EdgeInsets.all(value),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              color: Colors.green[100],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    orderCard(
                                      product: orderSnap,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 50),

                        // SizedBox(
                        //   width: getProportionateScreenWidth(30),
                        // )
                      ],
                    ),
                  );
              }),
        ),
      ),
    );
  }
}
