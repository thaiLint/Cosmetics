class ListBlog {
  String img;
  String title;
  String describe;
  ListBlog({required this.img,required this.title,required this.describe});
}
List<ListBlog> see = [
  ListBlog(
    img: "assets/images/blog1.webp",
    title: "Morning Glow Routine",
    describe: "Start your day fresh with these 3 simple skincare steps.",
  ),
  ListBlog(
    img: "assets/images/blog2.webp",
    title: "Secrets to Clear Skin",
    describe: "Learn how to keep your skin clean, hydrated, and breakout-free.",
  ),
  ListBlog(
    img: "assets/images/blog3.webp",
    title: "Night Care Essentials",
    describe: "Rebuild and nourish your skin while you sleep beautifully.",
  ),
  ListBlog(
    img: "assets/images/blog4.webp",
    title: "Top 5 Face Masks",
    describe: "Find the best masks for glowing, soft, and healthy skin.",
  ),
];
