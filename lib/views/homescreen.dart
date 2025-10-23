import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmetics/model/brand_list.dart';
import 'package:cosmetics/model/category.dart';
import 'package:cosmetics/model/gride_home.dart';
import 'package:cosmetics/model/home_image.dart';
import 'package:cosmetics/model/list_blog.dart';
import 'package:cosmetics/model/list_model.dart';
import 'package:cosmetics/views/brand_screen.dart';

import 'package:cosmetics/views/categories.dart';
import 'package:cosmetics/model/list_more.dart';
import 'package:cosmetics/views/dataCategories/screen_type2.dart';
import 'package:cosmetics/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome back.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFC2185B),),
            ),
            Text("Olivai"),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notification_add,
              size: 30,
              //color: Color(0xFFC2185B),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              size: 30,
              //color: Color(0xFFC2185B),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    [Color(0xFF8BC34A), Color(0xFF558B2F)], // coral
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
                                SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    detail[index].describe,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                    // maxLines: 3,
                                    // overflow: TextOverflow.ellipsis,
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
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
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
                          border: Border.all(color: Colors.grey, width: 1),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Text(
                    "New Arrivals",
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
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
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
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Image.asset(
                                show[index].img,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    show[index].subtitle,
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        152,
                                        152,
                                        152,
                                      ),
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    show[index].title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFC2185B)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$${show[index].price.toStringAsFixed(2)}" +
                                              "USD",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        //link to detail page
                                        InkWell(
                                          onTap: () {
                                            Get.to(DetailScreen(
                                                shows: show[index]));
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                                color: Color(0xFFC2185B)),
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
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Text(
                    "Brands",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(onPressed: () {
                    Get.to(BrandScreen());
                  }, child: Text("See all",style: TextStyle(color: Color(0xFFC2185B)),)),
                ],
              ),
            ),
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Center(
                        child: Image.asset(all[index].img, width: 200),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Text(
                    "Recommended for you",
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
                      )),
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
                        // border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Image.asset(
                                more[index].img,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    more[index].title,
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        152,
                                        152,
                                        152,
                                      ),
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
                                      color: Color(0xFFC2185B),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$${more[index].price.toStringAsFixed(2)}" +
                                              "USD",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: Color(0xFFC2185B)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
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
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Row(
                children: [
                  Text(
                    "Blog",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text("See all",style: TextStyle(color: Color(0xFFC2185B)),)),
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
                                    color: Color(0xFFC2185B)
                                  ),
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
