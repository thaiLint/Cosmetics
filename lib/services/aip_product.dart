import 'dart:convert';
import 'package:cosmetics/model/api_product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // ✅ Your Laravel backend API base URL
  final String baseUrl = "http://10.0.2.2:8000/api";

  // 🧾 Get all products
  Future<List<Products>> getAllProducts() async {
    final url = Uri.parse("$baseUrl/product/all");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List data = body['data'] ?? [];
        return data.map((e) => Products.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // 🔍 Get a single product by ID
  Future<Products> getProductById(int id) async {
    final url = Uri.parse("$baseUrl/product/$id");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return Products.fromJson(body['data']);
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }

 

  
}
