// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tfortdemo/size_confiq.dart';
import 'package:tfortdemo/utills/constants.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({Key? key, required this.icon, required this.press})
      : super(key: key);
  final Icon icon;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(100),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          // Positioned(
          //   top: -3,
          //   right: 0,
          //   child: Container(
          //     height: getProportionateScreenWidth(16),
          //     width: getProportionateScreenWidth(16),
          //     decoration: BoxDecoration(
          //       color: Color(0xFFFF4848),
          //       shape: BoxShape.circle,
          //       border:
          //           Border.all(width: 1.5, color: Colors.white),
          //     ),
          //     child: Center(
          //         // child: Text("3",),
          //         ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
