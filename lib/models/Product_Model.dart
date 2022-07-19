// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
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
    id: 1,
    title: "Custom Texted Bar",
    colors: [Color(0xFF6625E), Color(0xFF836D88)],
    description: "description",
    images: ["assets/images/product2.jpg"],
    price: 1500,
    rating: 3.5,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
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
    id: 3,
    title: "Recycled Chair",
    colors: [Color(0xFF6625E), Color(0xFF836D88)],
    description: "description",
    images: ["assets/images/product6.jpg", "assets/images/product7.jpg"],
    price: 2000.00,
    rating: 4.0,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    title: "Kids Building Box",
    colors: [Color(0xFF6625E), Color(0xFF836D88)],
    description: "description",
    images: ["assets/images/product5.jpg"],
    price: 2000,
    rating: 4.0,
    isFavourite: true,
    isPopular: true,
  ),
];
