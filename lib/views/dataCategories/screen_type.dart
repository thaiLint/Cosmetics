import 'package:cosmetics/model/dataSystem.dart';
import 'package:flutter/material.dart';

class ScreenType extends StatelessWidget {
  const ScreenType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Zendo"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 8 / 10,
        ),
        itemCount: lisrtData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    lisrtData[index].type,
                    height: 150,
                    width: 150,
                  ),
                  Text(lisrtData[index].name),
                  Spacer(),
                  Text("\$${lisrtData[index].price}"),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 150),
                        child: Center(
                            child: Center(
                                child: Text(
                          "+",
                          style: TextStyle(fontSize: 20),
                        ))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
