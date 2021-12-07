import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        height: 150,
        width: 150,
        margin: EdgeInsets.only(top: 150),
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          child: Image.asset('assets/image/Logo.png'),
        ));
  }
}