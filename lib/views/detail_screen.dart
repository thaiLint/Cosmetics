import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cosmetics/model/api_product.dart';
import 'package:cosmetics/services/aip_product.dart';

class DetailScreen extends StatefulWidget {
  final int productId;

  const DetailScreen({super.key, required this.productId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  int selectedVolume = 0;
  final List<String> volumes = ["50 ml", "100 ml", "150 ml"];
  late TabController _tabController;
  PageController? pageController;
  int currentImage = 0;
  Timer? timer;
  late Future<Products> productFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    productFuture = ApiService().getProductById(widget.productId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    pageController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Products>(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final product = snapshot.data!;

          pageController ??= PageController(initialPage: 0);
          if (timer == null && product.images.length > 1) {
            timer = Timer.periodic(const Duration(seconds: 3), (_) {
              if (pageController!.hasClients) {
                currentImage = (currentImage + 1) % product.images.length;
                pageController!.animateToPage(
                  currentImage,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            });
          }

          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Product Image ---
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            height: 400,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: product.images.length,
                              onPageChanged: (index) {
                                setState(() => currentImage = index);
                              },
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      product.images[index],
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () => Get.back(),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),

                      // --- Product Info ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skincare",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: const [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                Icon(Icons.star_half,
                                    color: Colors.orange, size: 18),
                                SizedBox(width: 4),
                                Text("4.5",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // --- Animated Tabs ---
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TabBar(
                                controller: _tabController,
                                labelColor: Colors.red,
                                unselectedLabelColor: Colors.grey,
                                labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                indicatorColor: Colors.red,
                                indicatorWeight: 3,
                                tabs: const [
                                  Tab(text: "Description"),
                                  Tab(text: "How To Use"),
                                  Tab(text: "Reviews"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: SizedBox(
                                height: 220,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 350),
                                  transitionBuilder: (child, animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(0.1, 0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: IndexedStack(
                                    key: ValueKey<int>(_tabController.index),
                                    index: _tabController.index,
                                    children: [
                                      // --- Description ---
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          product.description,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      // --- How to Use ---
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            "Apply evenly on face and neck after cleansing.\nUse twice daily for best results."),
                                      ),
                                      // --- Reviews ---
                                      ListView(
                                        children: [
                                          const SizedBox(height: 8),
                                          ListTile(
                                            leading: const CircleAvatar(
                                                backgroundColor: Colors.grey),
                                            title: const Text("@simonaun"),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 16),
                                                    Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 16),
                                                    Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 16),
                                                    Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 16),
                                                    Icon(Icons.star_half,
                                                        color: Colors.orange,
                                                        size: 16),
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                    "Love this! Gentle and makes my skin smooth."),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // --- Volume Selector ---
                            Text("Select Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700)),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(volumes.length, (index) {
                                bool isSelected = selectedVolume == index;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() => selectedVolume = index);
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.red.shade50
                                            : Colors.white,
                                        border: Border.all(
                                            color: isSelected
                                                ? Colors.red
                                                : Colors.grey.shade400,
                                            width: isSelected ? 2 : 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          volumes[index],
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.red
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // --- Fixed Bottom Bar ---
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, -2))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFC2185B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 14),
                            ),
                            onPressed: () {
                              Get.snackbar("Success", "Item added to cart!",
                                  backgroundColor: Colors.white);
                            },
                            child: const Text(
                              "Facebooke Messager",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC2185B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                        ),
                        onPressed: () {
                          Get.snackbar("Success", "Item added to cart!",
                              backgroundColor: Colors.white);
                        },
                        child: const Text(
                          "Add To Cart",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
