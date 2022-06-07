// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfortdemo/Screens/wrapper.dart';
import 'package:tfortdemo/models/user.dart';
import 'package:tfortdemo/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
    // ChangeNotifierProvider(
    //   create: (context) => ProductProvider(),
    //   child: MaterialApp(
    //     title: 'TrashForTrade',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     debugShowCheckedModeBanner: false,
    //     home: const SignInScreen(),
    //   ),
    // );
  }
}
