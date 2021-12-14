import 'package:flutter/material.dart';

Widget formField(String value, void Function(String) onChanged, String hint,
    {bool isPassword = false}) {
  return TextFormField(
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))));
}
