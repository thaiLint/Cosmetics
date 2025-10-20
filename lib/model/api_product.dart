class product {
  int? id;
  String? name;
  int? qty;
  String? price;
  String? description;
  String? image;
 

  product(
      {this.id,
      this.name,
      this.qty,
      this.price,
      this.description,
      this.image,
     });

  product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qty = json['qty'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
   
    return data;
  }
}