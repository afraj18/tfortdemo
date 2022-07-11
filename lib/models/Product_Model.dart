// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.title,
    required this.colors,
    required this.description,
    required this.images,
    this.rating = 0.0,
    required this.price,
    this.isFavourite = false,
    this.isPopular = false,
  });
}

//Our Products

List<Product> demoProduct = [
  Product(
    title: "Wood Chair",
    colors: [Color(0xFF6625E), Color(0xFF836D88)],
    description: "description",
    images: ["assets/images/product6.jpg", "assets/images/product7.jpg"],
    price: 2000.00,
    rating: 4.0,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    title: "Wood Table ",
    colors: [Color(0xFF6625E), Color(0xFF836D88)],
    description: "description",
    images: [
      "assets/images/product3.jpg",
    ],
    price: 5000,
    rating: 4.5,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    title: "Antique Wrist Watch",
    colors: [Color(0xFF6625E), Color(0xFF836D88)],
    description: "description",
    images: ["assets/images/product9.jpg"],
    price: 2000,
    rating: 4.0,
    isFavourite: true,
    isPopular: true,
  ),
];
