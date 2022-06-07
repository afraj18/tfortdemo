// ignore_for_file: camel_case_types, file_names, unused_field, prefer_const_constructors, prefer_final_fields, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/products.dart';
// import 'package:tfortdemo/Screens/signInScreen.dart';
// import 'package:tfortdemo/reusable_widgets/reusable_widget.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: hexStringToColor('#5b8c2a'),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignInScreen()),
                    // );
                    print("Logout");
                  });
                },
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.amber),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  height: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return hexStringToColor("#6b8c2a");
                          }
                          return hexStringToColor("#5b8c2a");
                        },
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Products",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => products()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
