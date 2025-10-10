import 'package:cosmetics/model/home_image.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome back.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Olivai"),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.1, 0.2),
                    blurRadius: 2,
                    color: Colors.brown,
                  ),
                ],
              ),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: detail.length,
              itemBuilder: (context, index) {
                final colors = [
                  const Color.fromARGB(255, 148, 255, 134), // green
                  const Color.fromARGB(255, 255, 204, 128), // orange
                  const Color.fromARGB(255, 144, 202, 249), // blue
                  const Color.fromARGB(255, 244, 143, 177), // pink
                  const Color.fromARGB(255, 255, 171, 145), // coral
                ];
                final containerColor = colors[index % colors.length];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 100,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.1, 0),
                          color: Colors.grey.withOpacity(1),
                          blurRadius: 5,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
                    // child: Image.asset("${detail[index].img}",),
                    // child: Stack(
                    //   children: [
                    //     Positioned(
                    //       top: 60,
                    //       left: 110,
                    //       child: Image.asset(detail[index].img, width: 300),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(15.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "${detail[index].title}",
                    //             style: TextStyle(
                    //               fontSize: 22,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           SizedBox(height: 8),
                    //           Text(
                    //             "${detail[index].describe}",
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               color: Colors.grey[800],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 230, left: 10),
                    //       child: Container(
                    //         width: 170,
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: const Color.fromARGB(255, 186, 255, 193),
                    //           border: Border.all(
                    //             color: const Color.fromARGB(255, 113, 113, 113),
                    //             width: 1,
                    //           ),
                    //         ),
                    //         child: Center(
                    //           child: Text("${detail[index].discount}"),

                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            detail[index].title,
                            
                            style: TextStyle(fontSize: 25,),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  detail[index].describe,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  detail[index].img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
