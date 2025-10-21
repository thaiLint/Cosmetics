import 'dart:convert';
import 'package:cosmetics/model/api_product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getApi() async {
    final url = Uri.parse("http://10.0.2.2:8000/api/product");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load products. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}


