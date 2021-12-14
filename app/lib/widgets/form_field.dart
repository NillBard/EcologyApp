import 'package:flutter/material.dart';

Widget formField(String value, void Function(String) onChanged, String hint,
    {bool isPassword = false, TextInputType type = TextInputType.text}) {
  return TextFormField(
      onChanged: onChanged,
      obscureText: isPassword,
      style: const TextStyle(fontSize: 16),
      keyboardType: type,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20)));
}
