import 'package:cosmetics/model/gride_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailScreen extends StatefulWidget {
  final GrideHome shows;

  const DetailScreen({super.key, required this.shows});

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
      body: Column(
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
                            color: isSelected
                                ? Colors.lightGreen
                                : Colors.grey, // green border if selected
                            width: isSelected ? 2 : 1, // thicker if selected
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
        ],
      ),
    );
  }
}
