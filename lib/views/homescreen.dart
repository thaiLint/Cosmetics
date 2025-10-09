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
            Text("welcome back.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("Olivai",)
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
                    color: Colors.brown     
                  )
                ]
              ),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      // body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 

      //   ), 
      //   itemBuilder: (context, index) {
      //     return Container(

      //     );
      //   },),
    );
  }
}