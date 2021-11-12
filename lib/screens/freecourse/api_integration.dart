import 'dart:convert';
import 'dart:io';

import 'package:deep_pocket_1/screens/freecourse/model_freecourse.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Welcome?> getCourse(String keyword) async {
    var client = http.Client();

    Welcome? result = null;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Rapidapi-Key': '0ea373fc86mshc668d389961cc64p1fa15djsndce7f2d4b4d9'
    };
    final response = await client.get(
      Uri.parse(
          'https://learning-objects-v2.p.rapidapi.com/search-provider?keywords=$keyword&lang=en&provider=Coursera&sort=popularity&model=strict&max=20&page=2'),
      // Send authorization headers to the backend.
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      // var jsonString = response.body;
      // print(response.body);
      var jsonMap = json.decode(response.body);

      // print(response.body.length);

      result = Welcome.fromJson(jsonMap);

      // print(result.response.content[0].title);

      return result;
    }
    return result;
  }
}
