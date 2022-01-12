// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/widgets/searchpage/search_footer.dart';
import 'package:google_clone/widgets/searchpage/search_header.dart';
import 'package:google_clone/widgets/searchpage/search_results.dart';
import 'package:google_clone/widgets/searchpage/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
    required this.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Title(
        color: Colors.blue,
        title: searchQuery,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header
                  const SearchHeader(),

                  // Tabs
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SearchTabs(),
                    ),
                  ),
                  const Divider(
                    height: 0,
                    thickness: 0,
                  ),

                  FutureBuilder<Map<String, dynamic>>(
                    future: ApiService().fetchData(
                      // context: context,
                      queryData: searchQuery,
                      start: start,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150,
                                top: 12,
                              ),
                              child: Text(
                                "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF70757a),
                                ),
                              ),
                            ),

                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data?['items'].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 10,
                                  ),
                                  child: SearchResults(
                                    linkToGo: snapshot.data?['items'][index]
                                        ['link'],
                                    link: snapshot.data?['items'][index]
                                        ['formattedUrl'],
                                    title: snapshot.data?['items'][index]
                                        ['title'],
                                    description: snapshot.data?['items'][index]
                                        ['snippet'],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 30),
                            
                            // pagination
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: const Text(
                                      "< Prev",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    ),
                                    onPressed: start != "0"
                                        ? () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                  searchQuery: searchQuery,
                                                  start: (int.parse(start) - 10)
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          }
                                        : () {},
                                  ),
                                  const SizedBox(width: 30),
                                  TextButton(
                                    child: const Text(
                                      "Next >",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blueColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) + 10)
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            const SearchFooter(),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
