// ignore_for_file: file_names, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tfortdemo/Screens/home/userTitle.dart';
import 'package:tfortdemo/models/userData.dart';

class UserDataList extends StatelessWidget {
  const UserDataList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<List<UserList>?>(context);
    // print(userData!.docs);
    // userData!.forEach((user) {
    //   print(user.address);
    //   print(user.email);
    //   print(user.name);
    //   print(user.phoneNo);
    //   print(user.userType);
    // });
    return ListView.builder(
      itemCount: userData!.length,
      itemBuilder: (context, index) {
        return UserTitle(user: userData[index]);
      },
    );
  }
}
