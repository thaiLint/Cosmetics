// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cosmetics/model/api_product.dart';
// import 'package:cosmetics/model/gride_home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DetailScreen extends StatefulWidget {
//   final Product product;
//   final List<String> shows;

//   const DetailScreen({
//     super.key,
//     required this.product,
//     required this.shows, 
//   });

//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }


// class _DetailScreenState extends State<DetailScreen>
//     with SingleTickerProviderStateMixin {
//   int selectedVolume = 0; // 0 = 30ml, 1 = 100ml
//   final List<String> volumes = ["30ml", "100ml"];
//   String volume = "30ml";

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//             onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
//         title: Text(widget.product.name ?? ""),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --- Image ---
//             if (widget.product.image != null)
//               Image.network(
//                 widget.product.image!,
//                 height: 300,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),

//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 widget.product.name ?? "",
//                 style:
//                     const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 widget.product.description ?? "",
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 "\$${widget.product.price?.toStringAsFixed(2) ?? "0.00"} USD",
//                 style: const TextStyle(fontSize: 20, color: Colors.red),
//               ),
//             ),

//             // Volume selection
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: List.generate(volumes.length, (index) {
//                   bool isSelected = selectedVolume == index;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedVolume = index;
//                           volume = volumes[index];
//                         });
//                       },
//                       child: Container(
//                         width: 90,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: isSelected ? Colors.red : Colors.grey,
//                               width: isSelected ? 2 : 1),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Center(
//                             child: Text(
//                           volumes[index],
//                           style: TextStyle(
//                               color: isSelected ? Colors.red : Colors.black),
//                         )),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // TabBar for details
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   TabBar(
//                     controller: _tabController,
//                     labelColor: Colors.red,
//                     unselectedLabelColor: Colors.grey,
//                     tabs: const [
//                       Tab(text: "How to use"),
//                       Tab(text: "Ingredients"),
//                       Tab(text: "Description"),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 120,
//                     child: TabBarView(controller: _tabController, children: [
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Use twice daily after cleansing."),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("Aloe Vera, Vitamin C, Hyaluronic Acid."),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(widget.product.description ?? ""),
//                       ),
//                     ]),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Add to cart button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   minimumSize: const Size.fromHeight(50),
//                 ),
//                 onPressed: () {
//                   FirebaseFirestore.instance.collection('cart').add({
//                     'name': widget.product.name,
//                     'price': widget.product.price,
//                     'image': widget.product.image,
//                     'volume': volume,
//                     'qty': 1,
//                     'timestamp': FieldValue.serverTimestamp(),
//                   });
//                   Get.snackbar("Success", "Item added to cart!");
//                 },
//                 child: const Text(
//                   "Add to Cart",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// extension on String? {
//   toStringAsFixed(int i) {}
// }
