// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResults extends StatefulWidget {
  final String link;
  final String title;
  final String linkToGo;
  final String description;
  const SearchResults({
    Key? key,
    required this.link,
    required this.title,
    required this.linkToGo,
    required this.description,
  }) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  bool _showUnderline = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.link),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (await canLaunch(widget.linkToGo)) {
                await launch(widget.linkToGo);
              }
            },
            onHover: (hovering) {
              setState(() {
                _showUnderline = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.link,
                  style: TextStyle(fontSize: 14, color: Color(0xFF202124)),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: blueColor,
                    decoration: _showUnderline
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.description,
          style: TextStyle(fontSize: 14, color: primaryColor),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
