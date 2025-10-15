import 'package:flutter/material.dart';
//import 'package:cosmetics/views/categories.dart';
import 'package:cosmetics/views/detail_screen.dart';
import 'package:cosmetics/views/homescreen.dart';
import 'package:cosmetics/views/profile_setting.dart';

class Bottombart extends StatefulWidget {
  const Bottombart({super.key});

  @override
  State<Bottombart> createState() => _BottombartState();
}

class _BottombartState extends State<Bottombart> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    // Homescreen()
    //Categories(),
    //DetailScreen(),
    ProfileSetting(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Color iconColor(int index) =>
      selectedIndex == index ? Colors.blue : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        shape: const CircleBorder(),
        onPressed: () {
          onItemTapped(2);
        },
        child: const Icon(Icons.storefront, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: iconColor(0)),
              onPressed: () => onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.search, color: iconColor(1)),
              onPressed: () => onItemTapped(1),
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: Icon(Icons.shopping_cart, color: iconColor(2)),
              onPressed: () => onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.person, color: iconColor(3)),
              onPressed: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
