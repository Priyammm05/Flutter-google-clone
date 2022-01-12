// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
              child: FooterText(title: 'India'),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FooterText(title: 'About'),
                    SizedBox(width: 10),
                    FooterText(title: 'Advertising'),
                    SizedBox(width: 10),
                    FooterText(title: 'Business'),
                    SizedBox(width: 10),
                    FooterText(title: 'How Search Works'),
                    SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FooterText(title: 'Privacy'),
                    SizedBox(width: 10),
                    FooterText(title: 'Terms'),
                    SizedBox(width: 10),
                    FooterText(title: 'Settings'),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
