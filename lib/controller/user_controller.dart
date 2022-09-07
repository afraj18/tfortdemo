// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_final_fields, unused_field

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tfortdemo/models/user_model.dart';

class userController extends GetxController {
  static userController instance = Get.find();
  // Rx<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel().obs;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailNameController = TextEditingController();
  TextEditingController _passwordNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  String userCollection = "users";
}
