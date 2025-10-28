import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'order_success_screen.dart';

class CardPaymentScreen extends StatefulWidget {
  final double total;

  const CardPaymentScreen({super.key, required this.total});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expiryDate = TextEditingController();
  final TextEditingController cvv = TextEditingController();
  final TextEditingController cardHolder = TextEditingController();

  /// ✅ Function to simulate payment & save record to Firestore
  Future<void> _processPayment() async {
    // Simple validation
    if (cardNumber.text.isEmpty ||
        expiryDate.text.isEmpty ||
        cvv.text.isEmpty ||
        cardHolder.text.isEmpty) {
      Get.snackbar(
        "Missing Info",
        "Please fill in all card details.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.shade400,
        colorText: Colors.white,
      );
      return;
    }

    try {
      // Save payment to Firestore
      await FirebaseFirestore.instance.collection('payments').add({
        'paymentMethod': 'Card Payment',
        'status': 'completed',
        'total': widget.total,
        'cardHolder': cardHolder.text,
        'cardNumber': '**** **** **** ${cardNumber.text.substring(cardNumber.text.length - 4)}',
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to order success screen
      Get.to(() => OrderSuccessScreen(
            total: widget.total,
            paymentMethod: "Card Payment",
            address: "N/A", // you can pass actual address from checkout
           
          ));

      Get.snackbar(
        "Payment Successful",
        "Your card payment has been processed successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFC2185B),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Payment failed: $e",
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
        title: const Text("Credit / Debit Card",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        //backgroundColor: const Color(0xFFC2185B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Card Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildTextField("Card Number", cardNumber, Icons.credit_card),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildTextField("Expiry Date", expiryDate, Icons.date_range),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTextField("CVV", cvv, Icons.lock_outline),
                ),
              ],
            ),
            const SizedBox(height: 15),

            _buildTextField("Card Holder Name", cardHolder, Icons.person),

            const Spacer(),
            ElevatedButton.icon(
              onPressed: _processPayment,
              icon: const Icon(Icons.payment, color: Colors.white),
              label: Text(
                "Pay \$${widget.total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC2185B),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: label == "Card Number" || label == "CVV"
          ? TextInputType.number
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFC2185B)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
