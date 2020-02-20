import 'package:flash_chat/screens/chat/chat_screen.dart';
import 'package:flash_chat/screens/history/history.dart';
import 'package:flash_chat/screens/home/home_screen.dart';
import 'package:flash_chat/screens/map/mapScreen.dart';
import 'package:flash_chat/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomTabBarNavigation extends StatefulWidget {
  @override
  _BottomTabBarNavigationState createState() => _BottomTabBarNavigationState();
}

class _BottomTabBarNavigationState extends State<BottomTabBarNavigation> {
  final List<Widget> pages = [
    Home(),
    ChatScreen(),
    MapScreen(),
    History(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.black54,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(
          icon: Icon(Icons.message), title: Text('Chat')),
      BottomNavigationBarItem(
          icon: Icon(Icons.location_on), title: Text('Map')),
      BottomNavigationBarItem(
          icon: Icon(Icons.compare_arrows), title: Text('History')),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Text('Profile')),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
