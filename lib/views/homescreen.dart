import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmetics/model/api_product.dart';
import 'package:cosmetics/model/brand_list.dart';
import 'package:cosmetics/model/category.dart';
import 'package:cosmetics/model/home_image.dart';
import 'package:cosmetics/model/list_blog.dart';
import 'package:cosmetics/model/list_model.dart';
import 'package:cosmetics/views/brand_screen.dart';
import 'package:cosmetics/services/aip_product.dart';
import 'package:cosmetics/views/categories.dart';
import 'package:cosmetics/model/list_more.dart';
import 'package:cosmetics/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Products>> futureProducts;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureProducts = apiService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome back.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC2185B),
              ),
            ),
            Text("Olivai"),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notification_add, size: 30),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu, size: 30),
          ),
        ],
      ),

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Horizontal Cards
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: detail.length,
                itemBuilder: (context, index) {
                  final gradients = [
                    [Color(0xFFF8BBD0), Color(0xFFC2185B)],
                    [Color(0xFF81D4FA), Color(0xFF0288D1)],
                    [Color(0xFFFFD54F), Color(0xFFFFB300)],
                    [Color(0xFFFFAB91), Color(0xFFD84315)],
                    [Color(0xFF8BC34A), Color(0xFF558B2F)],
                  ];
                  final gradientColors = gradients[index % gradients.length];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 60,
                            left: 270,
                            child: Image.asset(
                              detail[index].cream,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            left: 120,
                            top: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                detail[index].img,
                                width: 280,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detail[index].maintitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  detail[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    detail[index].describe,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    detail[index].discount,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 🔹 Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(() => const Categories()),
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Color(0xFFC2185B)),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Horizontal Category Chips
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: letter.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          letter[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 🔹 New Arrivals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  const Text(
                    "New Arrivals",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(() => const Categories()),
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Color(0xFFC2185B)),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Product List from API
            SizedBox(
              width: double.infinity,
              height: 260,
              child: FutureBuilder<List<Products>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  final show = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: show.length,
                    itemBuilder: (context, index) {
                      final product = show[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.network(
                                  product.image,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.broken_image,
                                    size: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 152, 152, 152),
                                          fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFC2185B),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "\$${product.price.toStringAsFixed(2)} USD",
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () => Get.to(
                                              () => DetailScreen(
                                                  productId: product.id),
                                            ),
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFC2185B),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // 🔹 Brands
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  const Text(
                    "Brands",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(() => const BrandScreen()),
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Color(0xFFC2185B)),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Brand Logos
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: all.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Image.asset(all[index].img, width: 100),
                    ),
                  ),
                ),
              ),
            ),

            // 🔹 Recommended & Blog sections omitted for brevity...
          ],
        ),
      ),
    );
  }
}
