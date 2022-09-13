// ignore_for_file: prefer_const_constructors, file_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/cart/cartScreen.dart';
import 'package:tfortdemo/Screens/home/components/NavBarButtons.dart';
import 'package:tfortdemo/Screens/home/components/searchField.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/size_confiq.dart';

class HomeHeader extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  HomeHeader({
    Key? key,
  }) : super(key: key);
  final AuthService _auth = AuthService();

  // here you write the codes to input the data into firestore

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    List<String> name = user.email.toString().split("@");
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SearchField(
          //   hintText: "Search Products",
          // ),
          // Text(
          //   "Hello, ${name[0]}",
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('t4tECom')
                .doc(user!.uid)
                .get(),
            builder: (context, snapshot) {
              final data = snapshot.data!;
              return Text(
                "Hello, ${data['name']}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              );
            },
          ),
          NavBarButton(
            icon: Icon(
              Icons.feedback_outlined,
              // color: hexStringToColor("#5b8c2a"),
              // size: 30,
            ),
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          NavBarButton(
            icon: Icon(
              Icons.logout,
              // color: hexStringToColor("#5b8c2a"),
            ),
            press: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
