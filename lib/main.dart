// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/responsive/mobile_screen_layout.dart';
import 'package:google_clone/responsive/responsive_layout.dart';
import 'package:google_clone/responsive/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      //
      home: ResponsiveLayoutScreen(
        mobileScreen: MobileScreenLayout(),
        webScreen: WebScreenLayout(),
      ),
    );
  }
}
