import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get() async {
    final response = await _client.get(
      ApiConstants.NEWS_URL,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
