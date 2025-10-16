class GrideHome {
  String img;
  String lettter;
  double price;
  String rate;
  String title;
  List<String> images;
  String subtitle;
  int? qty;

  GrideHome({
    required this.img,
    required this.images,
    required this.price,
    required this.title,
    required this.subtitle,
    required this.lettter,
    required this.rate,
    this.qty,
  });

    String get describe => "$title - $subtitle";
}

List<GrideHome> show = [
  GrideHome(
    img: "assets/images/p9.png",
    price: 30.00,
    title: "Aloe Vera Hydrating Cream",
    lettter: "CROSRX",
    rate: "4.8(128views)",
    subtitle: "Soothes dry skin and provides deep, lasting moisture.",
    images: [
      "assets/images/p9.png",
      "assets/images/p8.png",
      "assets/images/p10.png",
      "assets/images/p11.png",
    ],
  ),
  GrideHome(
    img: "assets/images/6.png",
    price: 40.20,
    title: "Aloe Vera Hydrating Cream",
    lettter: "CROSRX",
    rate: "2.8(100views)",
    subtitle: "Soothes dry skin and provides deep, lasting moisture.",
    images: [
      "assets/images/6.png",
      "assets/images/p1.png",
      "assets/images/d8.png",
      "assets/images/p2.png",
    ],
  ),
  // GrideHome(
  //   img: "assets/images/3.png",
  //   price: 34.10,
  //   title: "Vitamin C Brightening Serum",
  //   subtitle: "Evens out skin tone and restores natural radiance.",
  //   images: [
  //     "assets/images/3.png",
  //     "assets/images/d3.png",
  //     "assets/images/image.png",
  //   ],
  // ),
  GrideHome(
    img: "assets/images/7.png",
    price: 26.20,
    title: "Green Tea Facial Cleanser",
    lettter: "CROSRX",
    rate: "5.8(298views)",
    subtitle: "Removes impurities while keeping your skin fresh and soft.",
    images: [
      "assets/images/7.png",
      "assets/images/d1.png",
      "assets/images/d2.png",
    ],
  ),
  GrideHome(
    img: "assets/images/p4.png",
    price: 50.05,
    title: "Collagen Renewal Night Cream",
    lettter: "CROSRX",
    rate: "1.8(110views)",
    subtitle: "Reduces fine lines and improves skin elasticity overnight.",
    images: [
      "assets/images/p4.png",
      "assets/images/p5.png",
      "assets/images/p6.png",
      "assets/images/p7.png",
    ],
  ),
];
