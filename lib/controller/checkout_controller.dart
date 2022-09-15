import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfortdemo/reusable_widgets/reusable_widget.dart';

class checkoutControl {
  getUserData() async {
    var collection = FirebaseFirestore.instance.collection('');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var name = data['name'];
      var address = data['address'];
      var phoneNo = data['phoneNo'];
    }
  }

  Future<void> addToOrder(
    String id,
  ) async {
    int total = await FirebaseFirestore.instance
        .collection('cartSubTotal')
        .doc(id)
        .get()
        .then((value) {
      return value.get("subTotal");
    });
    String name = await FirebaseFirestore.instance
        .collection('t4tECom')
        .doc(id)
        .get()
        .then((value) {
      return value.get("name");
    });

    // int sTotal = int.parse(total);
    await FirebaseFirestore.instance.collection("Orders").add({
      'id': id,
      'name': name,
      'total': total,
      'products': 'Bricks, Earings',
    });
  }
}
