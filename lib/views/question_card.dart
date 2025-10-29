import 'package:cosmetics/model/question.dart';
import 'package:flutter/material.dart';

import 'choice_button.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int? selectedIndex;
  final Function(int) onSelect;
  final VoidCallback onNext;
  final bool isLast;

  const QuestionCard({
    required this.question,
    required this.selectedIndex,
    required this.onSelect,
    required this.onNext,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              question.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4))],
              ),
              child: Center(
                child: Text(question.emoji, style: TextStyle(fontSize: 64)),
              ),
            ),
            SizedBox(height: 20),
            ...List.generate(
              question.options.length,
              (i) => ChoiceButton(
                label: question.options[i],
                isSelected: selectedIndex == i,
                onTap: () => onSelect(i),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text(
                isLast ? "View Result" : "Next",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
