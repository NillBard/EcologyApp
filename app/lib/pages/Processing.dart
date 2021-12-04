import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Processing extends StatefulWidget {
 @override
 _Processing createState() => _Processing();

}

class _Processing extends State<Processing>{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecology"),
      ),
      body: Container(
        child: Center(
          child: Text('This is comething'),
        ),
      ),

    );

  }

}