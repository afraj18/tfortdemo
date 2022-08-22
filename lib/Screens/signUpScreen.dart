// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, avoid_print, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tfortdemo/reusable_widgets/reusable_widget.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/shared/loading.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({Key? key}) : super(key: key);
  final Function toggleView;
  SignUpScreen({required this.toggleView});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailNameController = TextEditingController();
  TextEditingController _passwordNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            extendBodyBehindAppBar: true,
            // appBar: AppBar(
            //   iconTheme: IconThemeData(
            //     color: hexStringToColor("#5b8c2a"),
            //     //change your color here
            //   ),
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   // title: Text(
            //   //   "SIGN IN",
            //   //   style: TextStyle(
            //   //     fontSize: 16,
            //   //     fontWeight: FontWeight.bold,
            //   //     color: hexStringToColor("#5b8c2a"),
            //   //   ),
            //   // ),
            // ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * .08, 20, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Text(
                          "Create an account",
                          style: TextStyle(
                            color: hexStringToColor("#5b8c2a"),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        reusableTextField("Name", Icons.person_outline, false,
                            _userNameController),
                        const SizedBox(
                          height: 10,
                        ),
                        reusableEmailField("Email Address",
                            Icons.email_outlined, false, _emailNameController),
                        const SizedBox(
                          height: 10,
                        ),
                        reusablePasswordField("Password", Icons.lock_outline,
                            _passwordNameController),
                        const SizedBox(
                          height: 10,
                        ),
                        reusableTextField(
                            "Address", Icons.home, false, _addressController),
                        const SizedBox(
                          height: 10,
                        ),
                        reusableNumberField("Phone Number", Icons.phone, false,
                            _phoneNoController),
                        const SizedBox(
                          height: 3,
                        ),
                        signInSignUpButton(
                          context,
                          false,
                          () async {
                            if (_formKey.currentState!.validate()) {
                              // print(_emailNameController.text);
                              // print(_passwordNameController.text);
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  _auth.registerWithEmailAndPassword(
                                      _emailNameController.text,
                                      _passwordNameController.text,
                                      _userNameController.text,
                                      _addressController.text,
                                      _phoneNoController.text);
                              if (result == null) {
                                setState(() {
                                  error = "Please set a valid email";
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        SignInOption(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Row SignInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "Have an account? ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            widget.toggleView();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SignUpScreen(),
            //   ),
            // );
          },
          child: Text(
            "Sign In",
            style: TextStyle(
                color: hexStringToColor("#5b8c2a"),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
