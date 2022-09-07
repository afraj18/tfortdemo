// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

//Add Products to Cart
  void addProduct(DocumentSnapshot product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
      // print("if");
    } else {
      _products[product] = 1;
      // print("else");
    }
    // print(" Product added");
    Get.snackbar(
      "Added",
      "Item has been added.",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  //Get Product
  get products => _products;

  //Remove Product
  void removeProduct(QueryDocumentSnapshot product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == _products);
      // print("cameHere 1");
    } else {
      _products[product] -= 1;
    }
  }
}
