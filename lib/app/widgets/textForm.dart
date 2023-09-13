import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget signUpForm(
    String labelText, String hintText, bool obsecureSwitch, bool verifBool,
    {required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: obsecureSwitch,
    decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        suffix: Visibility(
          visible: verifBool, // Show the icon only when obscureSwitch is true
          child: const Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.verified,
              color: Colors.white,
            ),
          ),
        ),
        hintStyle: const TextStyle(color: Color.fromRGBO(121, 138, 153, 1.000)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(230, 57, 70, 1.000), width: 1))),
  );
}

Widget buildInfoBox(String label, String value) {
  return Container(
    height: 40,
    width: 400,
    padding: EdgeInsets.symmetric(horizontal: 25),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(29, 53, 87, 1.000),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    ),
  );
}
