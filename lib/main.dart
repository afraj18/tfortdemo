// ignore_for_file: prefer_const_constructors, unused_field, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tfortdemo/Screens/splash/splashScreen.dart';

import 'package:tfortdemo/models/user.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/theme.dart';

import 'constants/firebase.dart';
import 'controller/app_controller.dart';

import 'package:tfortdemo/controller/product_controller.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(GetMaterialApp(
//     home: MyApp(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    // Get.put(UserController());
    Get.put(ProductController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final _cartController = Get.put(CartController());
  // final _productController = Get.put(ProductController());
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: splash_Screen(),
        title: "UpCycler's Lab",
        theme: theme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
