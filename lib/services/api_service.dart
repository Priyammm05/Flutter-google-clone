// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:google_clone/config/api_json.dart';
import 'package:google_clone/config/api_key.dart';
import 'package:http/http.dart' as http;

class ApiService {
  bool isDummy = false;

  Future<Map<String, dynamic>> fetchData(
      {required String queryData, String start = '0'}) async {
    try {
      if (!isDummy) {
        String q = queryData.contains(' ')
            ? queryData.split(' ').join('%20')
            : queryData;

        final response = await http.get(
          Uri.parse(
            'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$q&start=$start',
          ),
        );

        if (response.statusCode == 200) {
          final jsonData = response.body;
          final resData = json.decode(jsonData);
          return resData;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
  }
}
