import 'package:cosmetics/model/question.dart';
import 'package:cosmetics/views/progress_bar.dart';
import 'package:cosmetics/views/question_card.dart';
import 'package:cosmetics/views/result_screen.dart';
import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _controller = PageController();
  int _index = 0;
  final Map<int, int> _selected = {};

  final List<Question> _questions = [
    Question(
      text: "How does your skin feel after washing your face (without moisturizer)?",
      emoji: "🧖‍♀️",
      options: [
        "Tight / Dry",
        "Comfortable / Normal",
        "Shiny / Oily",
        "Dry in some areas, oily in others",
      ],
    ),
    Question(
      text: "By the middle of the day, how does your skin usually look?",
      emoji: "🌤️",
      options: [
        "Flaky / dull",
        "Balanced",
        "Shiny all over",
        "Shiny only on forehead/nose/chin (T-zone)",
      ],
    ),
    Question(
      text: "How visible are your pores?",
      emoji: "🔍",
      options: [
        "Hardly visible",
        "Visible mostly in T-zone",
        "Large and visible all over",
      ],
    ),
    Question(
      text: "How does your skin react to new skincare products?",
      emoji: "😣",
      options: [
        "Gets dry / itchy",
        "Usually fine",
        "Gets oily / clogged pores",
        "Redness, stinging, irritation",
      ],
    ),
  ];

  void _nextPage() {
    if (_index < _questions.length - 1) {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen()));
    }
  }

  void _prevPage() {
    if (_index > 0) {
      _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_index + 1) / (_questions.length + 1);

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _prevPage,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.pink),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Skin Type Quiz",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          ProgressBar(value: progress),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _questions.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) {
                final q = _questions[i];
                return QuestionCard(
                  question: q,
                  selectedIndex: _selected[i],
                  onSelect: (opt) {
                    setState(() => _selected[i] = opt);
                  },
                  onNext: _nextPage,
                  isLast: i == _questions.length - 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
