// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/search.dart';
import 'package:google_clone/widgets/search_buttons.dart';
import 'package:google_clone/widgets/translation_button.dart';
import 'package:google_clone/widgets/web_footer.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Gmail',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Images',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'images/more-apps.svg',
              color: primaryColor,
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: MaterialButton(
              color: Color(0xff1A73EB),
              onPressed: () {},
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.25),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Search(),
                      SizedBox(height: 20),
                      SeachButtons(),
                      SizedBox(height: 20),
                      TranslationButton(),
                    ],
                  ),
                  WebFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
