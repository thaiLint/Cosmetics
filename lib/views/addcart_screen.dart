import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmetics/views/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AddcartScreen extends StatelessWidget {
  //List<String> volume;
  AddcartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example delivery fee
    const double deliveryFee = 5.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite, color: Colors.lightGreen, size: 28),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          final cartItems = snapshot.data!.docs;

          // Calculate subtotal
          double subtotal = 0.0;
          for (var item in cartItems) {
            final price = item['price'] ?? 0.0;
            final qty = item['qty'] ?? 1;
            subtotal += price * qty;
          }
          double total = subtotal + deliveryFee;

          return Column(
            children: [
              // List of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final id = item.id;
                    final qty = item['qty'] ?? 1;
                    final imagePath = item['image'] ?? 'assets/images/p9.png';

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // Title + price + quantity
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top row: Title + Quantity
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item['name'] ?? 'Product',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.remove_circle_outline),
                                            onPressed: () {
                                              if (qty > 1) {
                                                FirebaseFirestore.instance
                                                    .collection('cart')
                                                    .doc(id)
                                                    .update({'qty': qty - 1});
                                              }
                                            },
                                          ),
                                          Text(qty.toString(),
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          IconButton(
                                            icon: const Icon(
                                                Icons.add_circle_outline),
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('cart')
                                                  .doc(id)
                                                  .update({'qty': qty + 1});
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Price below title
                                  Row(
                                    children: [
                                      Text(
                                        "\$${item['price'] ?? 0.0}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      // Text("${volume}")
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Delete button inline
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc(id)
                                    .delete();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Bottom summary + checkout button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.1, 0.2),
                      spreadRadius: 1,
                      blurRadius: 8,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$${subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Delivery Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Delivery",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$${deliveryFee.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Divider(height: 20, thickness: 1),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${total.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Get.to(() => CheckoutScreen(
                              subtotal: subtotal,
                              deliveryFee: deliveryFee,
                              total: subtotal + deliveryFee,
                            ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightGreen,
                        ),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
