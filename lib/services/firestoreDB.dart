// ignore_for_file: file_names, camel_case_types, unused_field
import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreDB {
  // Initialization fb fs
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //fetch Product list
  // Stream<List<ProductModel>> getAllProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => ProductModel.fromMap(doc.data()))
  //         .toList();
  //   });
  // }
}
