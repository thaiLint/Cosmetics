import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key});

  //  final CartController cartController = Get.find();



  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, 
        icon: Icon(Icons.arrow_back_ios)),
        title: Text("My Cart",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
         
        ],
      ),

    );
  }
}