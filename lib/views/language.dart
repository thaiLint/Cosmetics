import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text('choose_language'.tr()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<Locale>(
            value: const Locale('en'),
            groupValue: currentLocale,
            title: Row(
              children: const [
                Text("🇺🇸  English"),
              ],
            ),
            onChanged: (Locale? locale) {
              context.setLocale(locale!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<Locale>(
            value: const Locale('km'),
            groupValue: currentLocale,
            title: Row(
              children: const [
                Text("🇰🇭  Khmer"),
              ],
            ),
            onChanged: (Locale? locale) {
              context.setLocale(locale!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
