class ListMore {
  String img;
  String title;
  String subtitle;
  double price;
  ListMore({required this.img,required this.price,required this.subtitle,required this.title});
}
List<ListMore> more = [
  ListMore(
    img: "assets/images/9.png",
    price: 12.50,
    title: "Natural Skin Cream",
    subtitle: "Hydrates and softens your skin naturally",
  ),
  ListMore(
    img: "assets/images/10.png",
    price: 18.99,
    title: "Aloe Vera Face Gel",
    subtitle: "Calms irritation and provides a fresh glow",
  ),
  ListMore(
    img: "assets/images/13.png",
    price: 22.30,
    title: "Vitamin C Serum",
    subtitle: "Brightens skin tone and reduces dark spots",
  ),
  ListMore(
    img: "assets/images/12.png",
    price: 15.75,
    title: "Rose Water Toner",
    subtitle: "Refreshes and balances your skin pH",
  ),
];