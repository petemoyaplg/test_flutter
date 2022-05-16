import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/home.dart';
import 'package:test_flutter/screens/message.dart';
import 'package:test_flutter/screens/feed.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final screen = [
    const HomeScreen(),
    const MessageScreen(),
    const FeedScreen()
  ];
  final List<Widget> _pages = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        'Message',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        'Account',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        'Setting',
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }

  CurvedNavigationBar getBottomNavigation1(int selectedIndex) {
    return CurvedNavigationBar(
      backgroundColor: Colors.blueAccent,
      index: selectedIndex,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.messenger, size: 30),
        Icon(Icons.shopping_cart, size: 30),
      ],
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      animationCurve: Curves.easeInOutBack,
      // animationDuration: const Duration(milliseconds: 300),
    );
  }
}
