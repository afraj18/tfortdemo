// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  String? _name;
  double? _price;
  String? _productID;

  //Getter
  String? get name => _name;
  double? get price => _price;

  //Setter
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  saveProduct() {
    print("Hello");
  }
}
