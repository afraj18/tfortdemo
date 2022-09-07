// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tfortdemo/Screens/home/userDataList.dart';
import 'package:tfortdemo/models/cart.dart';

class UserList {
  final String? address;
  final String? email;
  final String? name;
  final String? phoneNo;
  final String? userType;
  final List<Cart>? cart;
  UserList({
    this.address,
    this.email,
    this.name,
    this.phoneNo,
    this.userType,
    this.cart,
  });

  // UserList.fromSnapshot(DocumentSnapshot snapshot, this.address, this.email,
  //     this.name, this.phoneNo, this.userType, this.cart) {
  //   address = snapshot.data()[NAME];
  //   email = snapshot.data()[EMAIL];
  //   name = snapshot.data()[ID];
  // }
}
