class Products {
  final int id;
  final String name;
  final String description;
  final double price;
  final int qty;
  final String category;
  final String image;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.qty,
    required this.category,
    required this.image,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] ?? 0,
      name: json['name'] ?? "No name",
      description: json['description'] ?? "No description",
      price: _parsePrice(json['price']),
      qty: json['qty'] ?? 0,
      category: json['category'] ?? "Unknown",
      image: json['image'] ?? "https://via.placeholder.com/150",
    );
  }

  // Helper to safely parse price
  static double _parsePrice(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }
}
