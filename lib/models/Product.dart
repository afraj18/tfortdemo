// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price, id;
  final Color bgColor;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    id: 1,
    image: "assets/images/logo1.png",
    title: "Bangles",
    price: 250,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    id: 2,
    image: "assets/images/product1.jpg",
    title: "Handmade Wood Chair",
    price: 199,
  ),
  Product(
    id: 3,
    image: "assets/images/product2.jpg",
    title: "Custom Named Color Bar",
    price: 180,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    id: 4,
    image: "assets/images/product3.jpg",
    title: "Casual Nolin",
    price: 149,
    bgColor: const Color(0xFFEEEEED),
  ),
];
