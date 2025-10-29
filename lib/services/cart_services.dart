import 'dart:convert';
import 'package:http/http.dart' as http;

class CartService { final String baseUrl = "http://10.0.2.2:8000/api";

  // Get all cart items
  Future<List<Map<String, dynamic>>> getCartItems() async {
    final response = await http.get(Uri.parse("$baseUrl/cart"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception("Failed to fetch cart");
    }
  }

  // Add product to cart
  Future<void> addToCart(int productId, int qty) async {
    final response = await http.post(
      Uri.parse("$baseUrl/cart"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "items": [
          {"product_id": productId, "quantity": qty}
        ]
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to add to cart: ${response.body}");
    }
  }

  // Reduce quantity by one
  Future<void> reduceQtyByOne(int productId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/cart/remove-one"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"product_id": productId}),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to reduce quantity");
    }
  }

  // Remove a single item
  Future<void> removeItem(int productId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/cart/remove-item"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"product_id": productId}),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to remove item");
    }
  }

  // Remove all items
  Future<void> removeAll() async {
    final response = await http.delete(Uri.parse("$baseUrl/cart/remove-all"));
    if (response.statusCode != 200) {
      throw Exception("Failed to remove all items");
    }
  }
}
