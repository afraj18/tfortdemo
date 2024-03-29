// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Upcyclers Lab",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/t4tLogo.png",
                height: 100,
                width: 120,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Trash for Trade is a Plastic Upcycling Social Enterprise."
                          "It is a social innovation idea developed from an open-source community, "
                          "‘Precious Plastic’ with the support of DreamSpace Academy. We have taken upon "
                          "this initiative using the upcycling machinery our team has built.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            // fontWeight: FontWeight.bold
                            // letterSpacing: ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.business,
                        color: hexStringToColor("#5b8c2a"),
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Trash For Trade Upcylers Lab",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: hexStringToColor("#5b8c2a"),
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "372/2, Government quarters road, Kallady, Batticaloa, 30000, Srilanka.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: hexStringToColor("#5b8c2a"),
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "trashfortrade@gmail.com",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: hexStringToColor("#5b8c2a"),
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "+94766646404 \n+94652226302",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 30,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.facebook_outlined,
            //           color: hexStringToColor("#5b8c2a"),
            //           size: 30,
            //         ),
            //         Icon(
            //           Icons.feedback_outlined,
            //           color: hexStringToColor("#5b8c2a"),
            //           size: 30,
            //         ),
            //         Icon(
            //           Icons.web_rounded,
            //           color: hexStringToColor("#5b8c2a"),
            //           size: 30,
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
