import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Codelab',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Named routes setup
      routes: {
        '/': (context) => BottomNavHome(), // Pakai BottomNav di sini
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
      initialRoute: '/',
    );
  }
}

// BottomNavHome: Mengatur Bottom Navigation
class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'First'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Second'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Third'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
