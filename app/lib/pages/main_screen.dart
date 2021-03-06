import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ecology/pages/recycling_tracker.dart';
import 'package:ecology/pages/profile.dart';
import 'package:ecology/pages/articles.dart';
import 'package:ecology/pages/proscessing_map.dart';
import 'package:ecology/providers/auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 3;
  final List<Widget> _widgetOptions = <Widget>[
    const RecyclingTracker(),
    const ProcessingMap(),
    const Articles(),
    const Profile()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (_, auth, __) {
      if (auth.user == null) {
        Future.delayed(const Duration(milliseconds: 1), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }

      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.restore_from_trash_rounded,
                size: 32,
              ),
              label: 'Tracker',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.map,
                size: 32,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.article,
                size: 32,
              ),
              label: 'Article',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          selectedItemColor: Colors.green,
          backgroundColor: Colors.transparent,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
        ),
      );
    });
  }
}
