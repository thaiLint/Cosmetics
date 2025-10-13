import 'package:cosmetics/views/SignIn.dart';
import 'package:cosmetics/views/track_screen.dart';
import 'package:cosmetics/views/order_screen.dart';
import 'package:cosmetics/views/profile_setting.dart';
import 'package:cosmetics/views/search_screen.dart';
import 'package:cosmetics/views/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // If user already logged in, go to home
      home: FirebaseAuth.instance.currentUser == null
          ? Login()
          : BottomBarController(),
    );
  }
}

class BottomBarController extends StatefulWidget {
  const BottomBarController({super.key});

  @override
  _BottomBarControllerState createState() => _BottomBarControllerState();
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Track'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
