import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProcessingMap extends StatefulWidget {
 @override
 _ProcessingMap createState() => _ProcessingMap();

}

class _ProcessingMap extends State<ProcessingMap>{
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