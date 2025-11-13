import 'package:cosmetics/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cosmetics/views/SignIn.dart';
import 'package:cosmetics/views/Sign_up.dart';
import 'package:cosmetics/views/bottom_bar_controller.dart';

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
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? SplashScreen()
          : BottomBarController(),
      routes: {
        '/signin': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/home': (context) => const BottomBarController(),
      },
    );
  }
}
