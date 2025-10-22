import 'package:cosmetics/views/SignIn.dart';
import 'package:cosmetics/views/Sign_up.dart';
import 'package:cosmetics/views/homescreen.dart';
import 'package:cosmetics/views/track_screen.dart';
import 'package:cosmetics/views/order_screen.dart';
import 'package:cosmetics/views/profile_setting.dart';
import 'package:cosmetics/views/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cosmetics App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? Login()
          : BottomBarController(),
      initialRoute: '/splash',
      routes: {
        '/signin': (context) => Login(),
        '/signup': (context) => SignUp(),
       '/home': (context) => Homescreen()
      },
    );
  }
}

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
      extendBody: true,
      body: _pages[_currentIndex],

      //  Floating center button (Track)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          backgroundColor: Color(0xFFC2185B),
          elevation: 8,
          onPressed: () {
            setState(() => _currentIndex = 2);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.storefront, color: Colors.white, size: 28),
        ),
      ),

      //  Rounded floating bottom bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
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
              const SizedBox(width: 40),
              _buildNavItem(Icons.shopping_cart_outlined, "Cart", 3),
              _buildNavItem(Icons.person, "Profile", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFC2185B) : Colors.black,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFFC2185B) : Colors.black,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
