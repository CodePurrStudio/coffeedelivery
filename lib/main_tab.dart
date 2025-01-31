import 'package:coffee_delivery/color.dart';
import 'package:coffee_delivery/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State createState() => _MainTabeState();
}

class _MainTabeState extends State<MainTab> {
  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home},
    {'icon': Icons.shopping_cart_rounded},
    {'icon': Icons.favorite},
    {'icon': Icons.notifications},
  ];

  int _selectedIndex = 0;

  List pages = [
    HomeScreen(),
    Center(
      child: Text(
        '📁 Files Page',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    ),
    Center(
        child: Text('⚙ Settings Page',
            style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(
        child: Text('⚙ noti Page',
            style: TextStyle(fontSize: 24, color: Colors.white))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.backgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: CoreColor.fromHex('22151F'),
        height: 60,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            return IconButton(
              icon: Icon(
                _navItems[index]['icon'],
                color: _selectedIndex == index
                    ? CoreColor.buttonColor
                    : CoreColor.buttonColor.withValues(alpha: 0.2),
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            );
          }),
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
