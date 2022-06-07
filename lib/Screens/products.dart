// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/edit_product.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexStringToColor("#5b8c2a"),
        title: Center(
          child: const Text(
            "Products",
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => edit_product(),
                ),
              );
            },
            icon: Icon(Icons.add),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("PRODUCTS"),
      ),
    );
  }
}
