import 'package:cosmetics/views/dataCategories/screen_type.dart';
import 'package:cosmetics/views/dataCategories/screen_type2.dart';
import 'package:cosmetics/views/dataCategories/screen_type3.dart';
import 'package:cosmetics/views/dataCategories/screen_type4.dart';
import 'package:cosmetics/views/dataCategories/screen_type5.dart';
import 'package:cosmetics/views/dataCategories/screen_type6.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new, size: 25),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenType(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/apple.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ឲ្យអក្សរចុះក្រោម
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            226,
                                            231,
                                            7,
                                            93,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenType2(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/apple.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ឲ្យអក្សរចុះក្រោម
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            226,
                                            231,
                                            7,
                                            93,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenType3(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/apple.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ឲ្យអក្សរចុះក្រោម
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            226,
                                            231,
                                            7,
                                            93,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenType4(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/apple.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ឲ្យអក្សរចុះក្រោម
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            226,
                                            231,
                                            7,
                                            93,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenType5(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/apple.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ឲ្យអក្សរចុះក្រោម
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello Sister",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            226,
                                            231,
                                            7,
                                            93,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenType6(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/apple.png",
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ឲ្យអក្សរចុះក្រោម
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello Pro",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            226,
                                            231,
                                            7,
                                            93,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(addData.name, style: TextStyle(fontSize: 20)),
                        Text("Text Push"),
                        Text("GitHub"),
                        Text("Push"),
                      ],
                    ),
                  );
                },

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
