class Category {
  String name;
  String image;
  Category({required this.image, required this.name});
}

List<Category> listCategory = [
  Category(image: "assets/categories/features.png", name: "All"),
  Category(image: "assets/categories/sunscreen.png", name: "Sun Screen"),
  Category(image: "assets/categories/blush.png", name: "Blush"),
  Category(image: "assets/categories/hair.png", name: "Hair Care"),
  Category(image: "assets/categories/perfume.png", name: "Perfume"),
  Category(image: "assets/categories/facial-mask.png", name: "Facial Mask"),
];
