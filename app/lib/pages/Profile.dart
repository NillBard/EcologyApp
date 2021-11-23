import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
 @override
 _Profile createState() => _Profile();

}

class _Profile extends State<Profile>{
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