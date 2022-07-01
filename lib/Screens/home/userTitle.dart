// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tfortdemo/models/userData.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class UserTitle extends StatelessWidget {
  final UserList? user;
  UserTitle({this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: hexStringToColor("#5b8c2a"),
            radius: 25.0,
          ),
          title: Text('${user!.name}'),
          subtitle: Text(
              'Email : ${user!.email}   Address : ${user!.address} \nPhone Number : ${user!.phoneNo}'),
        ),
      ),
    );
  }
}
