import 'package:cosmetics/model/api_product.dart';
import 'package:cosmetics/model/brand_list.dart';
import 'package:cosmetics/model/home_image.dart';
import 'package:cosmetics/model/list_blog.dart';
import 'package:cosmetics/model/list_model.dart';
import 'package:cosmetics/services/aip_product.dart';
import 'package:cosmetics/views/brand_screen.dart';
import 'package:cosmetics/views/categories.dart';
import 'package:cosmetics/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'header_section.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Products>> futureNewArrivals;
  late Future<List<Products>> futureRecommended;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Fetch products from API
    futureNewArrivals =
        apiService.getAllProducts(); // Can filter on backend if needed
    futureRecommended =
        apiService.getAllProducts(); // Can filter on backend if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ====== Header ======
            HeaderSection(),

            // ====== Featured / Slider ======
            SizedBox(
              height: 250,
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
                        boxShadow: [
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
                            left: 200,
                            child: Image.asset(
                              detail[index].cream,
                              width: 100,
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
                                width: 250,
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
                                SizedBox(height: 10),
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
                                SizedBox(height: 16),
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

            // ====== Categories ======
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(Categories());
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(color: Color(0xFFC2185B)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: letter.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xFFC2185B), width: 1),
                      ),
                      child: Center(
                        child: Text(
                          letter[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ====== New Arrivals ======
            SectionTitle(
                title: "New Arrivals", onSeeAll: () => Get.to(Categories())),
            SizedBox(
              height: 260,
              child: FutureBuilder<List<Products>>(
                future: futureNewArrivals,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text("Error: ${snapshot.error}",
                            style: TextStyle(color: Colors.red)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products found"));
                  } else {
                    final products = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    );
                  }
                },
              ),
            ),

            // ====== Brands ======
            SectionTitle(
                title: "Brands", onSeeAll: () => Get.to(BrandScreen())),
            Container(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: all.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 130,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Center(
                          child: Image.asset(all[index].img, width: 200)),
                    ),
                  );
                },
              ),
            ),

            // ====== Recommended ======
            SectionTitle(title: "Recommended for you", onSeeAll: () {}),
            SizedBox(
              height: 260,
              child: FutureBuilder<List<Products>>(
                future: futureRecommended,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text("Error: ${snapshot.error}",
                            style: TextStyle(color: Colors.red)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No recommended products"));
                  } else {
                    final products = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    );
                  }
                },
              ),
            ),
            //======Blog=============
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Text(
                    "Blog",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(color: Color(0xFFC2185B)),
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: see.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              see[index].img,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  see[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFFC2185B)),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  see[index].describe,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
          ],
        ),
      ),
    );
  }
}

// ====== Reusable Widgets ======
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  const SectionTitle({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 8, top: 16, bottom: 4),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Spacer(),
          TextButton(
              onPressed: onSeeAll,
              child:
                  Text("See all", style: TextStyle(color: Color(0xFFC2185B)))),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                product.image,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.description,
                      style: TextStyle(
                          color: Color.fromARGB(255, 152, 152, 152),
                          fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(product.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC2185B)),
                      overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      Text("\$${product.price.toStringAsFixed(2)} USD",
                          style: const TextStyle(fontSize: 18)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(DetailScreen(
                            productId: product.id,
                          ));
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFC2185B)),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
