// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tfortdemo/models/Product_Model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = 'products';
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  void onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      _firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());

  // final products = <Product>[].obs;
  // @override
  // void onInit() {
  //   products.bindStream(firestoreDB().getAllProducts());
  //   super.onInit();
  // }
}
