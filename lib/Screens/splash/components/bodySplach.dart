// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/splash/components/spashContent.dart';
import 'package:tfortdemo/Screens/wrapper.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/colors_utills.dart';
import 'package:tfortdemo/utills/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashdata = [
    {
      "text": "Welcome our lab, Let's Start.",
      "image": "assets/images/t4tLogo.png",
    },
    {
      "text": "Volunteerism is our main priority.",
      "image": "assets/images/t4tLogoCover.png",
    },
    {
      "text": "We sell Premium Products.",
      "image": "assets/images/t4tLogo.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => SplashContent(
                  text: splashdata[index]["text"].toString(),
                  image: splashdata[index]["image"].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashdata.length,
                        (index) =>
                            buildDot(index: index, currentPage: currentPage),
                      ),
                    ),
                    // SizedBox(
                    //   height: 100,
                    // ),
                    Spacer(
                      flex: 3,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wrapper()));
                        },
                        color: hexStringToColor("#5b8c2a"),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

AnimatedContainer buildDot({required int index, required int currentPage}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: EdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 20 : 6,
    decoration: BoxDecoration(
        color: currentPage == index
            ? hexStringToColor("#5b8c2a")
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3)),
  );
}
