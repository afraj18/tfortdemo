// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:tfortdemo/utills/colors_utills.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    // color: Colors.white,
  );
}

String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";
RegExp regex = RegExp(pattern);

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    validator: (value) => value!.isEmpty ? "Enter your username" : null,
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white70.withOpacity(.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: hexStringToColor("#5b8c2a").withOpacity(.7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextFormField reusableEmailField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
    validator: (val) {
      if (val!.isEmpty) {
        return "Enter an email address";
      } else if (!regex.hasMatch(val)) {
        return "Invalid email format";
      }
      return null;
    },
    // (val) => val!.isEmpty ? 'Enter an email address' : null,
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white70.withOpacity(.9),
        fontWeight: FontWeight.w600,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: hexStringToColor("#5b8c2a").withOpacity(.7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

IntlPhoneField reusableNumberField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return IntlPhoneField(
    initialCountryCode: 'LK',
    validator: (val) {
      if (val == null) {
        return "Phone number is not specified";
      } // else if (!regex.hasMatch(val)) {
      //   return "Invalid email format";
      // }
      return null;
    },
    // (val) => val!.isEmpty ? 'Enter an email address' : null,
    controller: controller,
    obscureText: isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white70.withOpacity(.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: hexStringToColor("#5b8c2a").withOpacity(.7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

TextFormField reusablePasswordField(
    String text, IconData icon, TextEditingController controller) {
  return TextFormField(
    validator: (val) => val!.length < 6 ? "Password is too small" : null,
    controller: controller,
    obscureText: true,
    enableSuggestions: false,
    autocorrect: false,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white70.withOpacity(.9),
        fontWeight: FontWeight.w600,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: hexStringToColor("#5b8c2a").withOpacity(.7),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
    keyboardType: TextInputType.visiblePassword,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? "SIGN IN" : "SIGN UP",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return hexStringToColor("#5b8c2a");
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}
