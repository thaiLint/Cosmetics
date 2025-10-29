import 'package:cosmetics/main.dart';
import 'package:cosmetics/views/bottom_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessScreen extends StatelessWidget {
  final double total;
  final String paymentMethod;
  final String address;

  const OrderSuccessScreen({
    super.key,
    required this.total,
    required this.paymentMethod,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC2185B).withOpacity(0.15),
              ),
              child: const Icon(Icons.check_circle, color: Color(0xFFC2185B), size: 80),
            ),
            const SizedBox(height: 20),

            const Text(
              "Order Successful!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Thank you for your purchase!",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 25),

            // 🧾 Order Summary
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildRow("Order ID", "#${DateTime.now().millisecondsSinceEpoch % 10000}"),
                  _buildRow("Address", address),
                  _buildRow("Payment", paymentMethod),
                  _buildRow("Total", "\$${total.toStringAsFixed(2)}"),
                  _buildRow("Status", "Processing", color: Color(0xFFC2185B)),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🏠 Back to Home
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                   Get.offAll(() => BottomBarController()); 
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC2185B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Back To Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value, {Color color = Colors.black87}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          Text(
            value,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}
