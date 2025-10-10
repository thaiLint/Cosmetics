import 'package:cosmetics/bloc/dataSystem.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Padding(
          padding: const EdgeInsets.all(75.0),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: lisrtData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  final addData = lisrtData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          addData.type,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
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
        ),
      ),
    );
  }
}
