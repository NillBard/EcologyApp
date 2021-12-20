import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        height: 150,
        width: 150,
        // margin: const EdgeInsets.only(top: 150),
        child: InputDecorator(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          child: Image.asset('assets/image/Logo.png'),
        ));
  }
}
