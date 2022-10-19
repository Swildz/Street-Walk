import 'dart:convert';

import 'package:application_street_walk/data/models/street_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _apiKey = 'apiKey=93a15d6c61b74f42a4c696eadd9af1c4';
  static const _baseUrl = 'https://newsapi.org/v2/';
  static const _domain = 'domains=wsj.com';

  // final http.Client client;

  // ApiService({required this.client});

  Future<StreetModel> fetchstreet() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _url = Uri.parse('$_baseUrl/everything?$_domain&$_apiKey');
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      return StreetModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
