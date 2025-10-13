import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Choose Language",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildLanguageOption('English', '🇺🇸'),
          _buildLanguageOption('Khmer', '🇰🇭'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language, String flag) {
    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 22)),
      title: Text(language),
      trailing: Radio<String>(
        value: language,
        groupValue: selectedLanguage,
        onChanged: (value) {
          setState(() {
            selectedLanguage = value!;
          });
        },
        activeColor: Colors.redAccent,
      ),
    );
  }
}
