import 'package:flutter/material.dart';

double width(context) {
  return MediaQuery.of(context).size.width;
}

double height(context) {
  return MediaQuery.of(context).size.height;
}

Widget textField(
  bool status,
  String label, {
  bool pass = false,
  Key? key,
  TextEditingController? controller,
}) {
  return TextField(
    key: key,
    controller: controller,
    readOnly: status,
    autofocus: false,
    decoration: InputDecoration(
      hintText: label,
      filled: true,
      fillColor: const Color(0xFFF5FCF9),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24.0, // 16.0 * 1.5
        vertical: 16.0,
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    ),
    obscureText: pass,
    onChanged: (value) {
      print(status ? "login" : "register");
    },
  );
}