import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
              const SizedBox(height: 20),
              
            
          ],
        ),
      )),
    );
  }
}