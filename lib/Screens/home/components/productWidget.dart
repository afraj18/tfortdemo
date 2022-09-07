// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/home/components/singleProductWidget.dart';
import 'package:tfortdemo/controller/product_controller.dart';
import 'package:tfortdemo/models/Product_Model.dart';

// import 'package:untitled/models/product.dart';
// import 'package:untitled/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductController productController = ProductController.instance;
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: productController.products.map((ProductModel product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList()));
  }
}
