import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.pink),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text("Skin Type Quiz", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: 1,
                minHeight: 10,
                color: Colors.pinkAccent,
                backgroundColor: Colors.pink.shade100,
              ),
              SizedBox(height: 50),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.pink.shade100),
                ),
                child: Center(child: Text("😊", style: TextStyle(fontSize: 64))),
              ),
              SizedBox(height: 30),
              Text("You Got Dry Skin",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconButton(Icons.play_arrow_rounded, "Detail"),
                  SizedBox(width: 40),
                  _iconButton(Icons.share, "Share"),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("View Product Match Your Skin",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: Icon(icon, size: 30, color: Colors.pinkAccent),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}
