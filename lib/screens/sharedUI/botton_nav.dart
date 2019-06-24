import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatefulWidget {
  @override
  _AppBottomNavState createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    TopicScreen(),
    AboutScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
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
              icon: Icon(FontAwesomeIcons.graduationCap, size: 20),
              title: Text('Topics')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.graduationCap, size: 20),
              title: Text('About')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.graduationCap, size: 20),
              title: Text('Profile'))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
