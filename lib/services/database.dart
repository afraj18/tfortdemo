// ignore_for_file: non_constant_identifier_names, unused_element, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tfortdemo/models/userData.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  // Collection Reference
  final CollectionReference eComeCollection =
      FirebaseFirestore.instance.collection('t4tECom');

  Future UpdateUserData(String name, String email, String userType,
      String address, String phoneNo, List cart) async {
    return await eComeCollection.doc(uid).set({
      'name': name,
      'email': email,
      'userType': userType,
      'address': address,
      'phoneNo': phoneNo,
      'cart': cart,
    }).onError((error, stackTrace) => print(error.toString()));
  }

  // UserList From DB
  List<UserList> _UserDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserList(
        address: (doc.data() as dynamic)['address'] ?? '',
        email: (doc.data() as dynamic)['email'] ?? '',
        name: (doc.data() as dynamic)['name'] ?? '',
        phoneNo: (doc.data() as dynamic)['phoneNo'] ?? '',
        userType: (doc.data() as dynamic)['userType'] ?? '',
        cart: (doc.data() as dynamic)['cart'] ?? '',
      );
    }).toList();
  }

  // Get Ecom User Stream
  Stream<List<UserList>> get UserData {
    return eComeCollection.snapshots().map(_UserDataListFromSnapshot);
  }
}
