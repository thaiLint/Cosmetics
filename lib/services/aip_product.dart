// import 'dart:convert';
// import 'package:cosmetics/model/home_image.dart';
// import 'package:http/http.dart' as http;

// // Change the URL depending on emulator/device:
// Future<List<Product>> fetchProducts() async {
//   // Emulator
//   final url = 'http://10.0.2.2:8000/api/product';
//   // Physical device:
//   // final url = 'http://192.168.1.100:8000/api/product';

//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     List data = jsonDecode(response.body);
//     return data.map((json) => Product.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load products');
//   }
// }
