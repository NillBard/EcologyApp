import 'package:echology/pages/MainScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecology App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainScreen(),      
    );
  }
}


