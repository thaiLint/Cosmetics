// lib/views/cash_on_delivery_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'order_success_screen.dart';

class CashOnDeliveryScreen extends StatelessWidget {
  final double total;
  final String address;

  const CashOnDeliveryScreen({
    super.key,
    required this.total,
    required this.address,
  });

  /// ✅ Function to save order details to Firestore
  Future<void> _confirmCashOrder(BuildContext context) async {
    try {
      // Add order to Firestore
      await FirebaseFirestore.instance.collection('payments').add({
        'paymentMethod': 'Cash on Delivery',
        'status': 'pending delivery',
        'total': total,
        'address': address,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to success screen
      Get.to(() => OrderSuccessScreen(
            total: total,
            paymentMethod: "Cash on Delivery",
            address: address,
            
          ));

      Get.snackbar(
        "Order Confirmed",
        "Your order has been placed successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFC2185B),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to confirm your order: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash on Delivery",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        //backgroundColor: const Color(0xFFC2185B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_shipping, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              "Please prepare exact cash upon delivery.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Total: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Deliver to: $address",
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _confirmCashOrder(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC2185B),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Confirm Order",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
