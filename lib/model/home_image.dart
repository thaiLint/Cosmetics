class product {
  String img;
  String cream;
  List<String> images;
  String title;
  String describe;
  String discount;
  product({
    required this.img,
    required this.cream,
    required this.title,
    required this.describe,
    required this.images,
    required this.discount,
  });
}

List<product> detail = [
  product(
    img: "assets/images/1.png",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    describe:
        "An advanced night cream formulated with powerful retinol . ",
    discount: "20% | OFF BUY NOW",
    images: [
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-1.jpg?v=1685000000",
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-2.jpg?v=1685000000",
    ],
  ),
  product(
    img:"assets/images/1.png",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    describe:
        "An advanced night cream formulated with powerful retinol and botanical extracts to reduce fine lines, improve skin texture, and enhance radiance. ",
    discount: "",
    images: [
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-1.jpg?v=1685000000",
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-2.jpg?v=1685000000",
    ],
  ),
  product(
    img:
        "https://imageskincare.com/cdn/shop/products/ORMEDIC_balancing_gel_masque_PDP_R01a.jpg?v=1679333767&width=600",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    describe:
        "An advanced night cream formulated with powerful retinol and botanical extracts to reduce fine lines, improve skin texture, and enhance radiance. It deeply nourishes while supporting natural collagen production for smoother, firmer, and more youthful-looking skin.",
    discount: "",
    images: [
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-1.jpg?v=1685000000",
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-2.jpg?v=1685000000",
    ],
  ),
  product(
    img:
        "https://imageskincare.com/cdn/shop/products/ORMEDIC_balancing_gel_masque_PDP_R01a.jpg?v=1679333767&width=600",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    describe:
        "An advanced night cream formulated with powerful retinol and botanical extracts to reduce fine lines, improve skin texture, and enhance radiance. It deeply nourishes while supporting natural collagen production for smoother, firmer, and more youthful-looking skin.",
    discount: "",
    images: [
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-1.jpg?v=1685000000",
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/products/retinol-youth-renewal-night-cream-2.jpg?v=1685000000",
    ],
  ),
];
