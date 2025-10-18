import 'package:cosmetics/model/category.dart';
import 'package:cosmetics/views/dataCategories/screen_type2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 82, 133, 204),
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
        body: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 30),
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(ScreenType2(
                          category: listCategory[index].name,
                        ));
                      },
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(95, 248, 187, 208),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 2,
                                    offset: Offset(0, 2))
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                "${listCategory[index].image}",
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
                              Text("${listCategory[index].name}"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
