import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'api_constants.dart';

class ApiClient {
  var logger = Logger();

  dynamic get(String path, token) async {
    final response = await http.get(
      '${ApiConstants.BASE_URL}$path',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth-token': 'Bearer $token',
      },
    );
    logger.i(response.statusCode);
    logger.i(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, token, Map<String, String> body) async {
    final response = await http.post(
      '${ApiConstants.BASE_URL}$path',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth-token': 'Bearer $token',
      },
      body: jsonEncode(body),
    );
    logger.i(response.statusCode);
    logger.i(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic auth(String path, Map<String, String> body) async {
    final response = await http.post(
      '${ApiConstants.BASE_URL}$path',
      body: jsonEncode(body),
    );
    logger.i(response.statusCode);
    logger.i(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
