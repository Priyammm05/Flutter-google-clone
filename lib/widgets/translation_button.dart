// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/widgets/language_text.dart';

class TranslationButton extends StatelessWidget {
  const TranslationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        SizedBox(width: 5),
        Text('Google Offered in : '),
        SizedBox(height: 5),
        LanguageText(language: 'हिन्दी'),
        SizedBox(width: 5),
        LanguageText(language: 'বাংলা'),
        SizedBox(width: 5),
        LanguageText(language: 'తెలుగు'),
        SizedBox(width: 5),
        LanguageText(language: 'मराठी'),
        SizedBox(width: 5),
        LanguageText(language: 'தமிழ்'),
        SizedBox(width: 5),
        LanguageText(language: 'ગુજરાતી'),
        SizedBox(width: 5),
        LanguageText(language: 'ಕನ್ನಡ'),
        SizedBox(width: 5),
        LanguageText(language: 'മലയാളം'),
        SizedBox(width: 5),
        LanguageText(language: 'ਪੰਜਾਬੀ'),
      ],
    );
  }
}
