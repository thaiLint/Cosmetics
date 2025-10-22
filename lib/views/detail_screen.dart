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
  final List<String> volumes = ["30ml", "100ml"];
  String volume = "30ml";

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
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
        title: const Text("Product Detail"),
      ),
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

          // Initialize PageController and Timer only once
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

          // --- Rest of your UI stays the same ---
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.images.isNotEmpty)
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: product.images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentImage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.network(
                          product.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),
                if (product.images.length > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(product.images.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        width: currentImage == index ? 12 : 8,
                        height: currentImage == index ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              currentImage == index ? Colors.red : Colors.grey,
                        ),
                      );
                    }),
                  ),

                // --- Product Name ---
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                // --- Description ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

                // --- Price ---
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "\$${product.price.toStringAsFixed(2)} USD",
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),

                // --- Volume selection ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(volumes.length, (index) {
                      bool isSelected = selectedVolume == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedVolume = index;
                              volume = volumes[index];
                            });
                          },
                          child: Container(
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: isSelected ? Colors.red : Colors.grey,
                                  width: isSelected ? 2 : 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              volumes[index],
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.red : Colors.black),
                            )),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 20),

                // --- TabBar for details ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: "How to use"),
                          Tab(text: "Ingredients"),
                          Tab(text: "Description"),
                        ],
                      ),
                      SizedBox(
                        height: 120,
                        child:
                            TabBarView(controller: _tabController, children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Use twice daily after cleansing."),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text("Aloe Vera, Vitamin C, Hyaluronic Acid."),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product.description),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- Add to Cart button (API or local)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Get.snackbar("Success", "Item added to cart!");
                    },
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
