import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products/models/api-model.dart';

class FetchApi {
  Future<List<CatsModel>> fetchData() async {
    var response = await http.get(
        Uri.parse('https://62d4154fcd960e45d452f790.mockapi.io/api/article'));

    if (response.statusCode == 200) {
      var apiResult = jsonDecode(response.body);
      var result = (apiResult as List);
      var catList = result.map((e) => CatsModel.fromJson(e)).toList();
      return catList;
    } else {
      throw Exception('Failed to load api');
    }
  }
}
