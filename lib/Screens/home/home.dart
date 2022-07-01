// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tfortdemo/Screens/cart/cartScreen.dart';
import 'package:tfortdemo/Screens/home/components/categories.dart';
import 'package:tfortdemo/Screens/home/components/new_arrival_products.dart';
import 'package:tfortdemo/Screens/home/components/popular_products.dart';
import 'package:tfortdemo/Screens/home/components/search_form.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: Text("Bottom Sheet"),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
          // icon: SvgPicture.asset("assets/icons/menu.svg"),
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          // icon: Icon(
          //   Icons.menu_rounded,
          //   color: Colors.black,
          // ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/Location.svg",
            ),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Trash4Trade",
              // style: Theme.of(context).textTheme.bodyText1,
              style: TextStyle(
                color: hexStringToColor("#5b8c2a"),
                fontFamily: 'Gordita',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_sharp,
              color: Colors.black,
            ),
            // SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
            ),
            const Text(
              "best products for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            Categories(),
            const NewArrivalProducts(),
            const PopularProducts(),
          ],
        ),
      ),
    );
    // StreamProvider<List<UserList>?>.value(
    //   value: DatabaseService().UserData,
    //   initialData: null,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //         "Trash4Trade",
    //       ),
    //       backgroundColor: hexStringToColor("#5b8c2a"),
    //       actions: <Widget>[
    //         FlatButton.icon(
    //           onPressed: () async {
    //             await _auth.signOut();
    //           },
    //           icon: Icon(
    //             Icons.person,
    //             color: Colors.white,
    //           ),
    //           label: Text(
    //             "Log out",
    //             style: TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //         FlatButton.icon(
    //           onPressed: () => _showSettingPanel(),
    //           icon: Icon(
    //             Icons.settings,
    //             color: Colors.white,
    //           ),
    //           label: Text(
    //             "Setting",
    //             style: TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     body: UserDataList(),
    //   ),
    // );
  }
}
