import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hexStringToColor("#5b8c2a"),
      // ignore: prefer_const_constructors
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
