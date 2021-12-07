import 'package:echology/pages/profile.dart';
import 'package:echology/pages/proscessing_map.dart';
import 'package:echology/pages/blog_page.dart';
import 'package:echology/pages/processing.dart';
import 'package:echology/pages/scanner.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 2;
  List<Widget> _widgetOptions = <Widget>[
    ProcessingMap(),
    Scanner(),
    blogPage(),
    Profile()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner_rounded,
            ),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article,
            ),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.green,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
      ),
    );
  }
}
