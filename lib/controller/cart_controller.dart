// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors, unused_local_variable, dead_code, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:tfortdemo/constants/firebase.dart';

class CartController {
  User? user = auth.currentUser;

  int total = 0;
  var _products = {}.obs;

  Future<void> addToCart(
      String id, String title, String image, String price, String qty) async {
    await FirebaseFirestore.instance.collection("cart").add({
      'id': id,
      'title': title,
      'img': image,
      'price': price,
      'qty': qty,
    }).then((value) => Get.snackbar(
          "Added",
          "Item has been added.",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        ));
  }

  Future<void> deleteCartProduct(DocumentSnapshot doc) async {
    String uid = user!.uid;
    int newPrice = int.parse(doc['price']);
    await FirebaseFirestore.instance.collection("cart").doc(doc.id).delete();

    await FirebaseFirestore.instance
        .collection('cartSubTotal')
        .doc(uid)
        .update({'subTotal': FieldValue.increment(-newPrice)});
  }

  // Future<void> setTotal(String price) async {
  //   int priceNew = int.parse(price);
  //   total += priceNew;
  //   print(total);

  // }

  void setTotal(id, price) async {
    // return;

    int newPrice = int.parse(price);
    // print(newPrice.toInt());
    var doc = await FirebaseFirestore.instance
        .collection('cartSubTotal')
        .where('id', isEqualTo: id)
        .get();
    if (doc.size >= 0) {
      return await FirebaseFirestore.instance
          .collection('cartSubTotal')
          .doc(id)
          .update({'subTotal': FieldValue.increment(newPrice)});
    } else {
      await FirebaseFirestore.instance.collection("cartSubTotal").doc(id).set({
        // 'id': id,
        'subTotal': price,
      });
    }
  }
//   int getTotal(id){
// var  document =  FirebaseFirestore.instance.collection('cartSubTotal').doc(id).get();
//         Map<String,dynamic>? value = document.data()as Map<String, dynamic>?;
//         print(value!['userId']);
//     return total;
//   }

// Future<String> getTotal(String id) async {
//     DocumentReference documentReference = FirebaseFirestore.instance.collection("cart").doc(id);
//     String specie;
//     await documentReference.get().then((snapshot) {
//       specie = snapshot.data()!['subTotal'].toString();
//     });
//     return specie;
//   }

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

  //Get Product
  get products => _products;

  //Remove Product
  void removeProduct(QueryDocumentSnapshot product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == _products);
      print("cameHere 1");
    } else {
      _products[product] -= 1;
    }
  }
}
