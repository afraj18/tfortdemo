// ignore_for_file: file_names, prefer_const_constructors, avoid_print, duplicate_ignore, prefer_final_fields, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:tfortdemo/Screens/homeScreen.dart';
// import 'package:tfortdemo/Screens/signUpScreen.dart';
import 'package:tfortdemo/reusable_widgets/reusable_widget.dart';
import 'package:tfortdemo/services/auth.dart';
import 'package:tfortdemo/shared/loading.dart';
import 'package:tfortdemo/utills/colors_utills.dart';

class SignInScreen extends StatefulWidget {
  final Function toggleView;
  SignInScreen({required this.toggleView});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.05, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      logoWidget('assets/images/t4tLogo.png'),
                      SizedBox(
                        height: 20,
                      ),
                      reusableEmailField("Enter email", Icons.email_outlined,
                          false, _emailController),
                      SizedBox(
                        height: 20,
                      ),
                      reusablePasswordField("Enter Password",
                          Icons.lock_outline, _passwordController),
                      SizedBox(
                        height: 10,
                      ),
                      signInSignUpButton(
                        context,
                        true,
                        () async {
                          if (_formKey.currentState!.validate()) {
                            // print(_emailController.text);
                            // print(_passwordController.text);
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                                    _emailController.text,
                                    _passwordController.text);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = "Invalid email / password";
                              });
                            }
                          }
                          // print(_emailController);
                          // print(_passwordController);
                          // if (_emailController.text.isNotEmpty &&
                          //     _passwordController.text.isNotEmpty) {
                          //   await FirebaseAuth.instance
                          //       .signInWithEmailAndPassword(
                          //           email: _emailController.text,
                          //           password: _passwordController.text)
                          //       .then(
                          //         (value) => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => homeScreen()),
                          //         ),
                          //       )
                          //       .onError((error, stackTrace) => {
                          //             print("Error" + error.toString()),
                          //           });
                          // } else {
                          //   print("Fill All fields");
                          // }
                        },
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                      SignUpOption(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "Don't have an account? ",
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
            "Sign Up",
            style: TextStyle(
                color: hexStringToColor("#5b8c2a"),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
