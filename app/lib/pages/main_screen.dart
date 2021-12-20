import 'package:echology/pages/recycling_tracker.dart';
import 'package:flutter/material.dart';

import 'package:echology/models/user.dart';
import 'package:echology/pages/profile.dart';
import 'package:echology/pages/blog_page.dart';
import 'package:echology/pages/proscessing_map.dart';

class MainScreen extends StatefulWidget {
  final UserModel userModel;

  const MainScreen(this.userModel, {Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 3;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      RecyclingTracker(),
      ProcessingMap(),
      const blogPage(),
      Profile(widget.userModel)
    ];
  }

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
              Icons.repeat_on_rounded,
            ),
            label: 'Recycling',
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
  }
}
