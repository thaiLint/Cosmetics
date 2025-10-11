import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

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

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/categories/—Pngtree—mock up cosmetic products for_15619191.png',
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text("Hello"),
                        ],
                      ),
                    ),

                    SizedBox(width: 40),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/apple.png',
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text("Apple"),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logos.png',
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text("Miking"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/categories/—Pngtree—mock up cosmetic products for_15619191.png',
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text("Hello"),
                        ],
                      ),
                    ),

                    SizedBox(width: 40),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/apple.png',
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text("Apple"),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logos.png',
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Text("Miking"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}