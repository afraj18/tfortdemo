// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfortdemo/models/Product_Model.dart';
import 'package:tfortdemo/reusable_widgets/custom_text.dart';
// import 'package:untitled/constants/controllers.dart';
// import 'package:untitled/models/product.dart';
// import 'package:untitled/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  SingleProductWidget({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product.img.toString(),
                  width: double.infinity,
                  height: 180,
                )),
          ),
          CustomText(
            text: "${product.title}",
            // size: 18,
            // weight: FontWeight.bold,
          ),
          // CustomText(
          //   text: "\$  ${product.price}",
          //   // color: Colors.grey,
          // ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "\$${product.price}",
                  // size: 22,
                  // weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    // cartController.addProductToCart(product);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
