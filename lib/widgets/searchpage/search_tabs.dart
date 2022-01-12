// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Tabs(
            icon: Icons.search,
            title: "All",
            isActive: true,
          ),
          SizedBox(width: 20),
          Tabs(
            icon: Icons.image,
            title: "Images",
          ),
          SizedBox(width: 20),
          Tabs(
            icon: Icons.map,
            title: "Map",
          ),
          SizedBox(width: 20),
          Tabs(
            icon: Icons.article,
            title: "News",
          ),
          SizedBox(width: 20),
          Tabs(
            icon: Icons.shopping_bag,
            title: "Shopping",
          ),
          SizedBox(width: 20),
          Tabs(
            icon: Icons.more_vert,
            title: "More",
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final String title;
  const Tabs(
      {Key? key,
      required this.icon,
      this.isActive = false,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isActive ? blueColor : Colors.grey,
              ),
              SizedBox(width: 3),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: isActive ? blueColor : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          isActive
              ? Container(
                  height: 3,
                  width: 40,
                  color: blueColor,
                )
              : Container(),
        ]);
  }
}
