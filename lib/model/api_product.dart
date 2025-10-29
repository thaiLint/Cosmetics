import 'package:flutter/widgets.dart';

class Products {
  final int id;
  final String name;
  final String description;
  final double price;
  final int qty;
  final String category;
  final String ingredients;
  final List<String> sizes;
  final String image;
  final List<String> images;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.qty,
    required this.category,
    required this.image,
    required this.images,
    required this.ingredients,
    required this.sizes,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? "No name",
      description: json['description']?.toString() ?? "No description",
      price: _parsePrice(json['price']),
      qty: json['qty'] ?? 0,
      category: json['category']?.toString() ?? "Unknown",
      image: json['image']?.toString() ?? "https://via.placeholder.com/150",
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e?.toString() ?? "https://via.placeholder.com/150")
              .toList() ??
          [],
      ingredients: json['ingredients']?.toString() ?? "No ingredients",
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((e) => e?.toString() ?? "N/A")
              .toList() ??
          ["N/A"],
    );
  }

  static double _parsePrice(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
