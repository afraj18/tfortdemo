// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tfortdemo/Screens/home/components/DiscountBanner.dart';
import 'package:tfortdemo/Screens/home/components/HomeHeader.dart';
import 'package:tfortdemo/Screens/home/components/categories.dart';
import 'package:tfortdemo/Screens/home/components/productCard.dart';
import 'package:tfortdemo/Screens/home/components/sectionTitle.dart';
import 'package:tfortdemo/Screens/home/components/specialOfferCard.dart';
import 'package:tfortdemo/Screens/productCategory/plasticProductScreen.dart';
import 'package:tfortdemo/Screens/productCategory/woodProductScreen.dart';

import 'package:tfortdemo/models/Product_Model.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream collectionRef =
        FirebaseFirestore.instance.collection('products').snapshots();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            HomeHeader(),
            SizedBox(
              height: 10,
            ),
            DiscountBanner(
              text1: "Mid - Year Purchase Offer",
              text2: "Cash Discount 50%",
            ),
            SizedBox(
              height: 20,
            ),
            CategoriesHomeScreen(),
            SizedBox(
              height: 12.5,
            ),
            SectionTitle(
              text: "Special for you",
              press: () {},
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialOfferCard(
                    category: "Wood Products",
                    subTitle: "Best Quality",
                    image: "assets/images/product1.jpg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WoodProducts(),
                        ),
                      );
                    },
                  ),
                  SpecialOfferCard(
                    category: "Upcyled Plastic Products",
                    subTitle: "Best Quality",
                    image: "assets/images/product8.jpg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlasticProduct(
                              // title: "Plastic Products",
                              ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                SectionTitle(
                  text: "Popular Products",
                  press: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                // StreamBuilder<QuerySnapshot>(
                //     stream: FirebaseFirestore.instance
                //         .collection("products")
                //         .snapshots(),
                //     builder: (context, snapshot) {
                //       if (!snapshot.hasData) {
                //         return Text("No Data");
                //       } else
                //         // ignore: curly_braces_in_flow_control_structures
                //         return SingleChildScrollView(
                //           scrollDirection: Axis.horizontal,
                //           child: Row(
                //             children: [
                //               ...List.generate(
                //                 demoProduct.length,
                //                 // snapshot.data!.docs.length,
                //                 (index) => ProductCard(
                //                   product: demoProduct[index],
                //                 ),
                //               ),
                //               SizedBox(
                //                 width: getProportionateScreenWidth(20),
                //               )
                //             ],
                //           ),
                //         );
                //     }),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("No Data");
                      } else
                        // ignore: curly_braces_in_flow_control_structures
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                // demoProduct.length,
                                snapshot.data!.docs.length,
                                (index) {
                                  DocumentSnapshot productSnap =
                                      snapshot.data!.docs[index];
                                  return ProductCard(product: productSnap);
                                },
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              )
                            ],
                          ),
                        );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
