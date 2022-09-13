// ignore_for_file: unused_import, file_names, avoid_types_as_parameter_names, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final int? id;
  final String? title, description;
  final String? img;
  // final List<dynamic>? colors;
  final String? price;
  // final bool? isFavourite, isPopular;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.img,
    this.price,
  });

  static ProductModel fromMap(Map<String, dynamic> snap) {
    ProductModel product = ProductModel(
        id: snap['id'],
        title: snap['title'],
        // colors: snap['colors'],
        description: snap['description'],
        img: snap['img'],
        price: snap['price']);
    return product;
  }
}

//Our Products
// List<ProductModel> demoProduct = [
//   ProductModel(
//     id: 1,
//     title: "Custom Texted Bar",
//     colors: [Color(0xFF6625E), Color(0xFF836D88)],
//     description: "description",
//     images: ["assets/images/product2.jpg"],
//     price: 1500,
//     rating: 3.5,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   ProductModel(
//     id: 2,
//     title: "Wood Table ",
//     colors: [Color(0xFF6625E), Color(0xFF836D88)],
//     description: "description",
//     images: [
//       "assets/images/product3.jpg",
//     ],
//     price: 5000,
//     rating: 4.5,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   ProductModel(
//     id: 3,
//     title: "Recycled Chair",
//     colors: [Color(0xFF6625E), Color(0xFF836D88)],
//     description: "description",
//     images: ["assets/images/product6.jpg", "assets/images/product7.jpg"],
//     price: 2000.00,
//     rating: 4.0,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   ProductModel(
//     id: 4,
//     title: "Kids Building Box",
//     colors: [Color(0xFF6625E), Color(0xFF836D88)],
//     description: "description",
//     images: ["assets/images/product5.jpg"],
//     price: 2000,
//     rating: 4.0,
//     isFavourite: true,
//     isPopular: true,
//   ),
// ];
