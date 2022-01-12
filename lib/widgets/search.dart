// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'images/google-logo.png',
            height: size.height * 0.12,
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: size.width > 768 ? size.width * 0.4 : size.width * 0.88,
          child: TextFormField(
            onFieldSubmitted: (query) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    searchQuery: query,
                    start: '0',
                  ),
                ),
              );
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: searchBorder,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: InkWell(
                onTap: () => (query) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        searchQuery: query,
                        start: '0',
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 16.0, right: 10, top: 2, bottom: 2),
                  child: SvgPicture.asset(
                    'images/search-icon.svg',
                    color: searchBorder,
                  ),
                ),
              ),
              suffixIcon: Padding(
                padding:
                    EdgeInsets.only(left: 12.0, right: 10, top: 2, bottom: 2),
                child: SvgPicture.asset(
                  'images/mic-icon.svg',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
