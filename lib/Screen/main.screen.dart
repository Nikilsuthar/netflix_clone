
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Sub Screen/account.screen.dart';
import 'Sub Screen/home.screen.dart';
import 'Sub Screen/search.screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black, // Set the black background
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 224, 20, 6),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
