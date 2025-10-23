class GrideHome {
  String img;
  String lettter;
  double price;
  String rate;
  String title;
  String describe;
  List<String> images;
  String subtitle;
  int? qty;
  String category;
  

  GrideHome(
      {required this.img,
      required this.images,
      required this.price,
      required this.title,
      required this.subtitle,
      required this.lettter,
      required this.describe,
      required this.rate,
      this.qty,
      required this.category
      });

  String get description => "$title - $subtitle";
}

List<GrideHome> show = [
  GrideHome(
      img: "assets/images/p9.png",
      price: 30.00,
      title: "Aloe Vera Hydrating Cream",
      lettter: "CROSRX",
      rate: "4.8(128views)",
      describe:
          "Hydrates and soothes dry skin, leaving it soft and refreshed. Helps reduce redness and irritation.",
      subtitle: "Soothes dry skin and provides deep, lasting moisture.",
      images: [
        "assets/images/p9.png",
        "assets/images/p8.png",
        "assets/images/p10.png",
        "assets/images/p11.png",
      ],
      category: "All"
     ),
  
  
  
  GrideHome(
      img: "assets/images/6.png",
      price: 40.20,
      title: "Aloe Vera Hydrating Cream",
      lettter: "CROSRX",
      rate: "2.8(100views)",
      describe:
          "A lightweight cream that calms irritation and locks in moisture for all-day comfort.",
      subtitle: "Soothes dry skin and provides deep, lasting moisture.",
      images: [
        "assets/images/6.png",
        "assets/images/p1.png",
        "assets/images/d8.png",
        "assets/images/p2.png",
      ],
      category: "Serum"
      ),
  GrideHome(
      img: "assets/images/7.png",
      price: 26.20,
      title: "Green Tea Facial Cleanser",
      lettter: "CROSRX",
      rate: "5.8(298views)",
      describe:
          "Gently removes dirt and impurities while balancing oil and calming the skin.",
      subtitle: "Removes impurities while keeping your skin fresh and soft.",
      images: [
        "assets/images/7.png",
        "assets/images/d1.png",
        "assets/images/d2.png",
      ],
      category: "Sun Screen"
     ),
  GrideHome(
      img: "assets/images/p4.png",
      price: 50.05,
      title: "Collagen Renewal Night Cream",
      lettter: "CROSRX",
      rate: "1.8(110views)",
      describe:
          "Boosts collagen production overnight for smoother, firmer, and youthful skin.",
      subtitle: "Reduces fine lines and improves skin elasticity overnight.",
      images: [
        "assets/images/p4.png",
        "assets/images/p5.png",
        "assets/images/p6.png",
        "assets/images/p7.png",
      ],
      category: "Sun Screen"
      ),
    GrideHome(
  img: "assets/images/lip1.png",
  price: 50.05,
  title: "Romand Zero Matte Lipstick Envy",
  lettter: "CROSRX",
  rate: "1.8(110views)",
  describe:
      "Reduces fine lines and improves skin elasticity overnight",
  subtitle: "Romand Zero Matte Lipstick in Envy delivers a smooth, long-lasting matte finish that keeps your lips vibrant all day. Enriched with moisturizing ingredients to prevent dryness, it glides on effortlessly and provides full coverage with intense pigmentation. Perfect for daily wear or special occasions, it enhances your natural beauty while keeping your lips soft and supple.",

  images: [
    "assets/images/lip1.png",
    "assets/images/lip6.png",
    "assets/images/lip7.png",
  ],
  category: "Lipstick"
),


      GrideHome(
  img: "assets/images/lip2.png",
  price: 40.05,
  title: "Maybelline Lifter Glaze Oil Balm",
  lettter: "CROSRX",
  rate: "3.8(110views)",
  describe: "Boosts collagen production overnight for smoother, firmer, and youthful skin.",
  subtitle: "Maybelline Lifter Glaze Oil Balm",
  images: [
    "assets/images/lip2.png",
    "assets/images/lip3.png",
    "assets/images/lip4.png",
    "assets/images/lip5.png",
  ],
  category: "Lipstick"
),


      GrideHome(
      img: "assets/images/p4.png",
      price: 50.05,
      title: "Collagen Renewal Night Cream",
      lettter: "CROSRX",
      rate: "1.8(110views)",
      describe:
          "Boosts collagen production overnight for smoother, firmer, and youthful skin.",
      subtitle: "Reduces fine lines and improves skin elasticity overnight.",
      images: [
        "assets/images/p4.png",
        "assets/images/p5.png",
        "assets/images/p6.png",
        "assets/images/p7.png",
      ],
      category: "Facial Mask"
      ),

  ];
