class Question {
  final String text;
  final List<String> options;
  final String emoji;

  Question({
    required this.text,
    required this.options,
    this.emoji = "🌸",
  });
}
