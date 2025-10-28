import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: double.infinity,
        height: 55, // ✅ same height as "Next" button
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: isSelected
                ? Colors.pinkAccent
                : Colors.white, // ✅ same color tone
            foregroundColor: Colors.white, // ✅ white text
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // ✅ same round corner
            ),
            side: BorderSide(
              color: isSelected ? Colors.pinkAccent : Colors.pink.shade100,
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
