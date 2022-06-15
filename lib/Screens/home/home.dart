// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tfortdemo/Screens/home/userDataList.dart';
import 'package:tfortdemo/models/userData.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/services/database.dart';
import 'package:tfortdemo/utills/colors_utills.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    return StreamProvider<List<UserList>?>.value(
      value: DatabaseService().UserData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Trash4Trade",
          ),
          backgroundColor: hexStringToColor("#5b8c2a"),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: () => _showSettingPanel(),
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: Text(
                "Setting",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: UserDataList(),
      ),
    );
  }
}
