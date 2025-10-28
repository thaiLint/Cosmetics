class QuizLogic {
  int dry = 0;
  int oily = 0;
  int combo = 0;
  int normal = 0;

  void answerQuestion(int questionNumber, String answer) {
    switch (questionNumber) {
      case 1:
        if (answer.contains("Tight")) dry++;
        if (answer.contains("Comfortable")) normal++;
        if (answer.contains("Oily")) oily++;
        if (answer.contains("Dry in some")) combo++;
        break;

      case 2:
        if (answer.contains("Flaky")) dry++;
        if (answer.contains("Balanced")) normal++;
        if (answer.contains("Shiny all")) oily++;
        if (answer.contains("T-zone")) combo++;
        break;

      case 3:
        if (answer.contains("Hardly")) normal++;
        if (answer.contains("T-zone")) combo++;
        if (answer.contains("Large")) oily++;
        break;

      case 4:
        if (answer.contains("dry")) dry++;
        if (answer.contains("fine")) normal++;
        if (answer.contains("clogged")) oily++;
        if (answer.contains("Redness")) dry++;
        break;
    }
  }

  String getResult() {
    Map<String, int> scores = {
      "Dry Skin": dry,
      "Oily Skin": oily,
      "Combination Skin": combo,
      "Normal Skin": normal,
    };

    return scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }
}
