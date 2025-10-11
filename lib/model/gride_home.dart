class GrideHome {
  String img;
  double price;
  String title;
  String subtitle;
  GrideHome({
    required this.img,
    required this.price,
    required this.title,
    required this.subtitle});
}
List<GrideHome> show = [
  GrideHome(
    img: "assets/images/6.png",
    price: 12.20,
    title: "Aloe Vera Hydrating Cream",
    subtitle: "Soothes dry skin and provides deep, lasting moisture.",
  ),
  GrideHome(
    img: "assets/images/3.png",
    price: 34.10,
    title: "Vitamin C Brightening Serum",
    subtitle: "Evens out skin tone and restores natural radiance.",
  ),
  GrideHome(
    img: "assets/images/7.png",
    price: 26.20,
    title: "Green Tea Facial Cleanser",
    subtitle: "Removes impurities while keeping your skin fresh and soft.",
  ),
  GrideHome(
    img: "assets/images/8.png",
    price: 50.05,
    title: "Collagen Renewal Night Cream",
    subtitle: "Reduces fine lines and improves skin elasticity overnight.",
  ),
];

