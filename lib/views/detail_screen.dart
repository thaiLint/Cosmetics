import 'package:cosmetics/model/gride_home.dart';
import 'package:cosmetics/model/list_more.dart';
import 'package:cosmetics/views/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailScreen extends StatefulWidget {
  final GrideHome shows;

  DetailScreen({super.key, required this.shows});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Track selected volume
  int selectedVolume = 0; // 0 = 30ml, 1 = 100ml

  final List<String> volumes = ["30ml", "100ml"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, size: 27),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite, size: 27),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image slider
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),

            // Price row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "\$${widget.shows.price.toStringAsFixed(2)} USD",
                    style: const TextStyle(
                      fontSize: 23,
                    ),
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
                      color: const Color.fromARGB(255, 177, 229, 118),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "20%",
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 128, 37),
                            fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(
                  volumes.length,
                  (index) {
                    bool isSelected = selectedVolume == index;
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedVolume = index; // update selection
                          });
                        },
                        child: Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white, // always white background
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  isSelected ? Colors.lightGreen : Colors.grey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              volumes[index],
                              style: TextStyle(
                                fontSize: 17,
                                color: isSelected
                                    ? Colors.lightGreen
                                    : Colors.black, // text color changes
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.badge_outlined,
                        size: 20,
                        color: Colors.lightGreen,
                        weight: 3,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "In stock",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  Row(
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
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.store_mall_directory_outlined,
                          size: 20, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        "Available in the nearest store",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                widget.shows.describe,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 370,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 218, 218),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child:
                          Text("Description", style: TextStyle(fontSize: 18)),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              height: 300, // adjust height as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.shows
                                        .describe, // or any detailed instructions
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.arrow_right, size: 35),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: 370,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 218, 218),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child:
                          Text("Ingredients", style: TextStyle(fontSize: 18)),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              height: 300, // adjust height as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ingredients",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.shows
                                        .describe, // or any detailed instructions
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.arrow_right, size: 35),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: 370,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 218, 218),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("How to use", style: TextStyle(fontSize: 18)),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              height: 300, // adjust height as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "How to use",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    widget.shows
                                        .describe, // or any detailed instructions
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.arrow_right, size: 35),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Row(
                children: [
                  Text(
                    "Products you may also like",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Get.to(Categories());
                      },
                      child: Text("See all")),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: more.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  more[index].img,
                                  height: 140,
                                  width: double.infinity,
                                 
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: InkWell(
                                  onTap: () {
                                    // Add your favorite logic here
                                    //print("Heart clicked for index $index");
                                    Get.snackbar("Cosmetic", "Thank you!");
                                  },
                              
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: const Color.fromARGB(255, 62, 62, 62),
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  more[index].title,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 152, 152, 152),
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  more[index].subtitle,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\$${more[index].price.toStringAsFixed(2)} USD",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.to(
                                              DetailScreen(shows: show[index]));
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                          child: Icon(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1
                      )
                    ),
                    child: Center(child: Icon(Icons.favorite_border,size: 30,)),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: 290,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("add to cart",style: TextStyle(fontSize: 20),)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
