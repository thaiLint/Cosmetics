class Product {
  int? id;
  String? name;
  int? qty;
  double? price;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.qty,
      this.price,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qty = json['qty'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
