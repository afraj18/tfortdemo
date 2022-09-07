// // ignore: file_names
// // ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:tfortdemo/models/cart.dart';
// import 'package:tfortdemo/size_confiq.dart';

// class WishListItems extends StatelessWidget {
//   const WishListItems({Key? key, required this.cart}) : super(key: key);
//   final Cart cart;
//   @override
//   Widget build(BuildContext context) {
//     var kPrimaryColor;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: getProportionateScreenWidth(88),
//             child: AspectRatio(
//               aspectRatio: 0.88,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF5F6F9),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Image.asset(
//                   cart.product.images[0],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: getProportionateScreenWidth(200),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   cart.product.title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                   maxLines: 2,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     text: "\$ ${cart.product.price}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: kPrimaryColor,
//                     ),
//                     // children: [
//                     //   TextSpan(
//                     //     text: " x${cart.numOfItem}",
//                     //     style: TextStyle(color: kTextColor),
//                     //   )
//                     // ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
