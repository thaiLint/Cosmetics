import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmetics/model/gride_home.dart';
import 'package:cosmetics/model/list_more.dart';
import 'package:cosmetics/views/addcart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final GrideHome shows;
  DetailScreen({super.key, required this.shows});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  int selectedVolume = 0; // 0 = 30ml, 1 = 100ml
  final List<String> volumes = ["30ml", "100ml"];
  String volume = "30ml";

  late TabController _tabController;

  // Example static data (you can load from Firebase later)
  final List<Map<String, String>> productDetails = [
    {
      'howToUse':
          'Apply a small amount to your face twice daily after cleansing.',
      'ingredient': 'Aloe Vera, Vitamin C, Green Tea Extract, Hyaluronic Acid.',
      'description':
          'This lightweight moisturizer deeply hydrates and brightens your skin for a healthy glow.'
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final details = productDetails[0]; // load first product’s info

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, size: 27),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            // child: Icon(Icons.shopping_bag, size: 27),
            child: IconButton(onPressed: (){
              Get.to(AddcartScreen());
            }, icon: Icon(Icons.shopping_bag,color: Color(0xFFC2185B),)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Product Images ---
            Container(
              width: double.infinity,
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.shows.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.shows.images[index]),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.shows.lettter),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.shows.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "\$${widget.shows.price.toStringAsFixed(2)} USD",
                    style: const TextStyle(fontSize: 23),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "\$40.40 USD",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 45,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(0xFFC2185B),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "20%",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- Volume Selection ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(volumes.length, (index) {
                  bool isSelected = selectedVolume == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Color(0xFFC2185B) : Colors.grey,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            volumes[index],
                            style: TextStyle(
                              fontSize: 17,
                              color:
                                  isSelected ? Color(0xFFC2185B) : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 10),

            // --- Stock Info ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Icon(Icons.badge_outlined,
                      size: 20, color: Color(0xFFC2185B)),
                  SizedBox(width: 5),
                  Text(
                    "In stock",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC2185B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),

            // --- Delivery Info ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.delivery_dining_sharp,
                      size: 20, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    "Free Delivery",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),

            // --- Store Info ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Icon(Icons.store_mall_directory_outlined,
                      size: 20, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    "Available in the nearest store",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Color(0xFFC2185B),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFFC2185B),
                    tabs: [
                      Tab(text: "How to use"),
                      Tab(text: "Ingredient"),
                      Tab(text: "Description"),
                    ],
                  ),
                  SizedBox(
                    height: 90, // height of tab content
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(12),
                          child: Text(details['howToUse']!,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(12),
                          child: Text(details['ingredient']!,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(12),
                          child: Text(details['description']!,
                              style: const TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                InkWell(
                  onTap: () {
                    FirebaseFirestore.instance.collection('cart').add({
                      'name': widget.shows.title,
                      'price': widget.shows.price,
                      'image': widget.shows.images[0],
                      'qty': 1,
                      'timestamp': FieldValue.serverTimestamp(),
                    });

                    //Get.to(AddcartScreen());
                    Get.snackbar("Success", "Item added to cart!");
                    
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color:Color(0xFFC2185B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(
                          color: Color(0xFFC2185B),
                          width: 1
                        )
                        ),
                        child: Icon(Icons.favorite,color: Color(0xFFC2185B),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
