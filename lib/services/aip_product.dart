import 'dart:convert';
import 'package:cosmetics/model/api_product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:8000/api";

  // Fetch products (from /products)
  Future<List<Products>> getAllProducts() async {
    final url = Uri.parse("$baseUrl/product/all"); // Laravel endpoint

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(response.body);
        final List<dynamic> data = jsonBody['data'] ?? [];

        return data
            .map((e) => Products.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  Future<Products> getProductById(int id) async {
    final url = Uri.parse("$baseUrl/product/$id");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(response.body);
        final productData = jsonBody['data'];
        return Products.fromJson(productData);
      } else {
        throw Exception(
            'Failed to load product. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }
}
