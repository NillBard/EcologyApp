import 'package:echology/pages/recycling_tracker.dart';
import 'package:echology/providers/auth.dart';
import 'package:flutter/material.dart';

import 'package:echology/pages/profile.dart';
import 'package:echology/pages/blog_page.dart';
import 'package:echology/pages/proscessing_map.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 3;
  final List<Widget> _widgetOptions = <Widget>[
    RecyclingTracker(),
    ProcessingMap(),
    const BlogPage(),
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
          Navigator.pushNamed(context, '/login');
        });
      }

      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.refresh_sharp,
              ),
              label: 'Tracker',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
              ),
              label: 'Map',
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
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
        ),
      );
    });
  }
}
