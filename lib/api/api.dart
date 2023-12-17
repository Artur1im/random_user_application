import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user_application/api/api_error.dart';

class Api {
  // ignore: constant_identifier_names
  static const ENDPOINT = 'randomuser.me/api';
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, path, params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, path);
    http.Response response =
        await http.post(url, body: params, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }
}
