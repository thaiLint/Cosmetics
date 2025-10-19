import 'package:cosmetics/views/order_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;

  const CheckoutScreen({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Address section
  final List<String> addressList = [
    "Phnom Penh, Cambodia",
    "Siem Reap, Cambodia",
    "Battambang, Cambodia",
  ];
  String? selectedAddress;
  final TextEditingController newAddressController = TextEditingController();

  // Payment section
  String? selectedPayment;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'Cash on Delivery',
      'icon': Icons.attach_money,
    },
    {
      'name': 'ABA Pay',
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'name': 'Credit / Debit Card',
      'icon': Icons.credit_card,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.1, 0.2),
                      blurRadius: 5,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildRow("Subtotal",
                          "\$${widget.subtotal.toStringAsFixed(2)}"),
                      const SizedBox(height: 10),
                      _buildRow("Delivery Fee",
                          "\$${widget.deliveryFee.toStringAsFixed(2)}"),
                      const Divider(),
                      _buildRow("Total", "\$${widget.total.toStringAsFixed(2)}",
                          isBold: true, fontSize: 18),
                    ],
                  ),
                ),
              ),
            ),
            _buildAddressSection(),
            _buildPaymentSection(),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if ((selectedAddress == null || selectedAddress!.isEmpty) &&
                      newAddressController.text.isEmpty) {
                    Get.snackbar("Error", "Please select or enter address");
                  } else if (selectedPayment == null) {
                    Get.snackbar("Error", "Please choose a payment method");
                  } else {
                    final address =
                        selectedAddress ?? newAddressController.text.trim();
                    // Get.snackbar("Checkout Successful",
                    //     "Address: $address\nPayment: $selectedPayment\nTotal: \$${widget.total.toStringAsFixed(2)}");
                    Get.to(() => OrderSuccessScreen(
                          total: widget.total,
                          paymentMethod: selectedPayment!,
                          address: selectedAddress ??
                              newAddressController.text.trim(),
                        ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Shipping Address",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Dropdown
          DropdownButtonFormField<String>(
            value: selectedAddress,
            hint: const Text("Select your address"),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.location_on, color: Colors.green),
            ),
            items: addressList
                .map((address) => DropdownMenuItem<String>(
                      value: address,
                      child: Text(address),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedAddress = value;
              });
            },
          ),
          const SizedBox(height: 15),

          const Text("Or enter new address"),
          const SizedBox(height: 8),
          TextField(
            controller: newAddressController,
            decoration: InputDecoration(
              hintText: "Type your new address here",
              prefixIcon:
                  const Icon(Icons.home_outlined, color: Colors.lightGreen),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment Method",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...paymentMethods.map((method) {
            return Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: selectedPayment == method['name']
                      ? Colors.green
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: RadioListTile<String>(
                value: method['name'],
                groupValue: selectedPayment,
                activeColor: Colors.lightGreen,
                onChanged: (value) {
                  setState(() {
                    selectedPayment = value;
                  });
                },
                title: Text(
                  method['name'],
                  style: const TextStyle(fontSize: 16),
                ),
                secondary: Icon(method['icon'], color: Colors.green),
              ),
            );
          }).toList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Row builder
  Widget _buildRow(String title, String value,
      {bool isBold = false, double fontSize = 16}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: fontSize)),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
