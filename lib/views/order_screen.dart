import 'package:cosmetics/views/review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Active + Completed
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabBar(
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 2.5,
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Active Orders
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ActiveOrder(
                    name: "Moisturizing Cream",
                    price: 25.99,
                    image: "assets/images/6.png",
                    qty: "50 ml",
                    delivery: "Arriving Tomorrow",
                    trackorder: "Track Order",
                  ),
                  const SizedBox(height: 12),
                  ActiveOrder(
                    name: "Face Serum",
                    price: 15.49,
                    image: "assets/images/7.png",
                    qty: "100 ml",
                    delivery: "Delivered Today",
                    trackorder: "Track Order",
                  ),
                ],
              ),
            ),

            // Completed Orders

            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CompletedOrder(
                    name: "Moisturizing Cream",
                    price: 25.99,
                    image: "assets/images/6.png",
                    qty: "50 ml",
                    delivery: "Arriving Tomorrow",
                    restore: "Completed",
                  ),
                  const SizedBox(height: 12),
                  CompletedOrder(
                    name: "Face Serum",
                    price: 15.49,
                    image: "assets/images/7.png",
                    qty: "100 ml",
                    delivery: "Delivered Today",
                    restore: "Completed",
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                'Completed Orders',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ActiveOrder({
  required String name,
  required double price,
  required String image,
  required String qty,
  required String delivery,
  required String trackorder,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.withOpacity(0.2),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Product Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    qty,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 237, 239, 240),
                        border: Border(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "In deliver",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 232, 115, 156)),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 141, 172),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Track Order",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget CompletedOrder({
  required String name,
  required double price,
  required String image,
  required String qty,
  required String delivery,
  required String restore,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.withOpacity(0.2),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    qty,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 237, 239, 240),
                        border: Border(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "In deliver",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 232, 115, 156)),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () => Get.to(Review()),
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 141, 172),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Leave Review",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
