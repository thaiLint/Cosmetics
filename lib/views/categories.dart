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
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
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

                              builder: (context) => const DetailScreen(),

                              builder: (context) => ScreenType(),

                            ),
                          );
                        },
                        child: Padding(

                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),

                          padding: const EdgeInsets.only(left: 20, right: 20),

                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/apple.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: Color.fromARGB(226, 231, 7, 93),
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

                              builder: (context) => const DetailScreen(),

                              builder: (context) => ScreenType2(),

                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),

                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/apple.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: Color.fromARGB(226, 231, 7, 93),
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
                  builder: (context) => const DetailScreen(),

                              builder: (context) => ScreenType3(),

                            ),
                          );
                        },
                        child: Padding(

                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),

                          padding: const EdgeInsets.only(left: 20, right: 20),

                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/apple.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: Color.fromARGB(226, 231, 7, 93),
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

                              builder: (context) => const DetailScreen(),

                              builder: (context) => ScreenType4(),

                            ),
                          );
                        },
                        child: Padding(

                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),

                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/apple.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: Color.fromARGB(226, 231, 7, 93),
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

                              builder: (context) => const DetailScreen(),
                              builder: (context) => ScreenType5(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/apple.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello Sister",
                                        style: TextStyle(
                                          color: Color.fromARGB(226, 231, 7, 93),
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
                              builder: (context) => const DetailScreen(),
                              builder: (context) => ScreenType6(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/apple.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "Hello Pro",
                                        style: TextStyle(
                                          color: Color.fromARGB(226, 231, 7, 93),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
