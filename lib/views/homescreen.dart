// import 'package:cosmetics/model/api_product.dart';
// import 'package:cosmetics/services/aip_product.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'detail_screen.dart'; // Your existing detail screen

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   late Future<List<Products>> futureProducts;
//   final ApiService apiService = ApiService();

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = apiService.getAllProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Cosmetics Products")),
//       body: FutureBuilder<List<Products>>(
//         future: futureProducts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text("Error: ${snapshot.error}",
//                     style: const TextStyle(color: Colors.red)));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No products found"));
//           }

//           final products = snapshot.data!;
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               return ProductCard(product: products[index]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Products product;
//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//             child: Image.network(
//               product.image,
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.broken_image, size: 50),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               product.name,
//               style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.pink),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               product.description,
//               style: const TextStyle(color: Colors.grey),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
//             child: Text(
//               "\$${product.price.toStringAsFixed(2)}",
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_forward_ios),
//               onPressed: () {
//                 // Get.to(() => DetailScreen(product: product, shows: [product.image]));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
