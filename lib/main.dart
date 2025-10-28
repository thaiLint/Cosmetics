import 'package:cosmetics/views/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:cosmetics/views/bottom_bar_controller.dart';
import 'package:get/get.dart';

void main() {
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
      home: const BottomBarController(),
      

    );
  }
}
