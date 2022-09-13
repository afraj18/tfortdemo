// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class WishListController {
  var _products = {}.obs;

  Future<void> addToWishList(
      String id, String title, String image, String price) async {
    await FirebaseFirestore.instance.collection("wishlish").add({
      'id': id,
      'title': title,
      'img': image,
      'price': price,
    }).then((value) => Get.snackbar(
          "Added",
          "Item has been added to Wish List.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        ));
  }

  Future<void> deleteWishListProduct(DocumentSnapshot doc) async {
    await FirebaseFirestore.instance
        .collection("wishlish")
        .doc(doc.id)
        .delete();
  }

// //Add Products to Cart
//   void addProduct(id, product) {
//     if (_products.containsKey(id)) {
//       _products[product.data()] += 1;
//       print(product.data());
//     } else {
//       _products[product] = 1;
//       // print("else");
//     }
//     // print(" Product added");
//     // final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');

//     // collectionReference.doc(id).collection('yourNewCollection').doc().where('singleField', isEqualTo: yourValue).update({
//     //         'singleField': 'whatever you want',
//     //       });
//     Get.snackbar(
//       "Added",
//       "Item has been added.",
//       snackPosition: SnackPosition.TOP,
//       duration: Duration(seconds: 2),
//     );
//   }

}
