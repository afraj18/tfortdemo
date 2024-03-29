// ignore_for_file: prefer_const_constructors, file_names, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfortdemo/Screens/details/details_screen.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final DocumentSnapshot product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: product),
          )),
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(
                    product['img'].toString(),
                    width: 100,
                    height: 100,
                    // "https://firebasestorage.googleapis.com/v0/b/t4tdemo-app.appspot.com/o/ProductImages%2Fproduct0.jpg?alt=media&token=111c7ca6-2e5a-4d12-8a36-8a586357e5ed"
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                product['title'],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenWidth(15),
                ),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "\$ ${product['price']}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: getProportionateScreenWidth(15),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(30),
                    ),
                    child: Container(
                      width: getProportionateScreenWidth(15),
                      height: getProportionateScreenWidth(15),
                      decoration: BoxDecoration(
                        color: true
                            ? Color(0xFF5b8c2a).withOpacity(.15)
                            : kSecondaryColor.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: true
                            ? Color(0xFF5b8c2a).withOpacity(.7)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
