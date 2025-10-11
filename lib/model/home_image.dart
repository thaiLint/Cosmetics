class product {
  String img;
  String cream;
  String maintitle;
  String title;
  String describe;
  String discount;
  product({
    required this.img,
    required this.cream,
    required this.maintitle,
    required this.title,
    required this.describe,
    required this.discount,
  });
}

List<product> detail = [
  product(
    img: "assets/images/1.png",
    title: "Retinol Youth Renewal Night Cream",
    maintitle: "Murad",
    cream: "assets/images/cream.png",
    describe:
        "An advanced night cream formulated with powerful retinol . ",
    discount: "20% | OFF BUY NOW",
    
  ),
  product(
    img:"assets/images/2.png",
    maintitle: "Murad",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    describe:
        "An advanced night cream formulated with powerful retinol . ",
    discount: "20% | OFF BUY NOW",
    
  ),
  product(
    img:
        "assets/images/4.png",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    maintitle: "Murad",
    describe:
        "An advanced night cream formulated with powerful retinol . ",
    discount: "20% | OFF BUY NOW",
    
  ),
  product(
    img:
        "assets/images/5.png",
    title: "Retinol Youth Renewal Night Cream",
    cream: "assets/images/cream.png",
    maintitle: "Murad",
    describe:
        "An advanced night cream formulated with powerful retinol . ",
    discount: "20% | OFF BUY NOW",
    
  ),
];
