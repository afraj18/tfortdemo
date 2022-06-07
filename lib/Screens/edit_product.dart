// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:tfortdemo/Screens/products.dart';
import 'package:tfortdemo/provider/product_provider.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class edit_product extends StatefulWidget {
  const edit_product({Key? key}) : super(key: key);

  @override
  State<edit_product> createState() => _edit_productState();
}

class _edit_productState extends State<edit_product> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexStringToColor("#5b8c2a"),
        title: Center(
          child: Text('Edit Product'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Product Name",
              ),
              onChanged: (value) {
                productProvider.changeName(value);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "Product Price"),
              onChanged: (value) {
                productProvider.changePrice(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => hexStringToColor("#5b8c2a"))),
              onPressed: () {
                AlertDialog(
                  title: Text("Alert"),
                );
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => hexStringToColor("#990000"))),
              onPressed: () {
                print("Delete");
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
