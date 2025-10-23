class Category {
  String name;
  String image;
  Category({required this.image, required this.name});
}

List<Category> listCategory = [
  Category(image: "assets/categories/beauty-and-cosmetics.png", name: "All"),
  Category(image: "assets/categories/cream.png", name: "Sun Screen"),
  Category(image: "assets/categories/make-up.png", name: "Blush"),
  Category(image: "assets/categories/oil.png", name: "Serum"),
  Category(image: "assets/categories/lipstick.png", name: "Lipstick"),
  Category(image: "assets/categories/facial-mask.png", name: "Facial Mask"),
];

