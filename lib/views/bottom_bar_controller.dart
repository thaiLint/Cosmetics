import 'package:flutter/material.dart';
import 'package:cosmetics/views/homescreen.dart';
import 'package:cosmetics/views/track_screen.dart';
import 'package:cosmetics/views/order_screen.dart';
import 'package:cosmetics/views/profile_setting.dart';
import 'package:cosmetics/views/search_screen.dart';

class BottomBarController extends StatefulWidget {
  const BottomBarController({super.key});

  @override
  State<BottomBarController> createState() => _BottomBarControllerState();
}

class _BottomBarControllerState extends State<BottomBarController> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    SearchScreen(),
    TrackScreen(),
    OrderScreen(),
    ProfileSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      // Floating center Track button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFC2185B),
          elevation: 8,
          onPressed: () {
            setState(() => _currentIndex = 2); // Go to Track page
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.storefront, color: Colors.white, size: 28),
        ),
      ),

      // Rounded bottom bar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 171, 171).withOpacity(0.2),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.search, "Search", 1),
            const SizedBox(width: 40), // space for center button
            _buildNavItem(Icons.shopping_cart_outlined, "Cart", 3),
            _buildNavItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
    );
  }

  // Reusable bottom navigation item
  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuad,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF8E1E7) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFC2185B) : Colors.black54,
              size: isSelected ? 28 : 24,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuad,
              child: SizedBox(
                width: isSelected ? 60 : 0,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFFC2185B)
                        : Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: isSelected ? 14 : 0,
                  ),
                  child: Text(
                    isSelected ? label : '',
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
