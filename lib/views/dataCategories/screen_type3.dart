import 'package:cosmetics/model/dataSystem.dart';
import 'package:flutter/material.dart';

class ScreenType3 extends StatelessWidget {
  const ScreenType3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: Text("Zendo")),
        body: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ចំនួន column
              mainAxisSpacing: 10, // vertical spacing
              crossAxisSpacing: 10, // horizontal spacing
              childAspectRatio: 1, // aspect ratio (width / height)
            ),
            itemCount: listType3.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200, // អាចកំណត់ទំហំ
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12)),
                child: Stack(
                  children: [
                    // 🟡 រូបភាព
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        listType3[index].type,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
                    // 🟢 ប៊ូតុង (ដាក់នៅលើ)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.addchart_sharp,
                            color: Colors.white, size: 30),
                      ),
                    ),
                    Spacer(),
                    // 🟢 អត្ថបទខាងក្រោម
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 160,
                        ),
                        child: Text(
                          listType3[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
