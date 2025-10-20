import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'order_success_screen.dart'; // import your OrderSuccessScreen

class AbaPaymentScreen extends StatelessWidget {
  final double total;
  final String paymentId;

  const AbaPaymentScreen({
    super.key,
    required this.total,
    required this.paymentId,
  });

  /// Update Firestore when user confirms payment
  Future<void> _confirmPayment() async {
    try {
      await FirebaseFirestore.instance
          .collection('payments')
          .doc(paymentId)
          .update({
        'status': 'completed',
        'paidAt': FieldValue.serverTimestamp(),
        'paymentType': 'ABA Pay',
      });

      // ✅ Show success message
      Get.snackbar(
        "Payment Success",
        "Your payment of \$${total.toStringAsFixed(2)} was successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFC2185B),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // ✅ Navigate to OrderSuccessScreen
      // Get.off(() => OrderSuccessScreen(
      //       total: total,
      //       paymentMethod: "ABA Pay",
      //     ));
      Get.to(OrderSuccessScreen(total: total, paymentMethod: "ABA Pay", address: ""));

    } catch (e) {
      Get.snackbar(
        "Payment Failed",
        "Failed to update payment: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final qrData = {
      "paymentId": paymentId,
      "total": total,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("ABA Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Scan this QR to Pay",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // ✅ QrImage using qr_flutter v4.0.1
              QrImageView(
                data: qrData.toString(), // must be a String
                size: 220,
                backgroundColor: Colors.white,
              ),

              const SizedBox(height: 30),
              Text(
                "Total: \$${total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _confirmPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC2185B),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "I Have Paid",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
