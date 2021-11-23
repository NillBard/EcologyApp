
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Scanner extends StatefulWidget {
  @override
  _Scanner createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner - googleflutter.com'),
        ),
        body: Center(child: Text('scanner')));
  }
}
