// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class LanguageText extends StatelessWidget {
  final String language;
  const LanguageText({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          language,
          style: TextStyle(color: blueColor),
        ),
      ),
    );
  }
}
