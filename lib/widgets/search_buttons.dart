// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class SeachButtons extends StatelessWidget {
  const SeachButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            seachButton('Google Search'),
            SizedBox(width: 15),
            seachButton("I'm feeling Lucky"),
          ],
        ),
      ],
    );
  }

  Widget seachButton(String title) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: searchColor,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      onPressed: () {},
      child: Text(title),
    );
  }
}
