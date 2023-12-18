// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user_application/api/api_error.dart';

class Api {
  static const ENDPOINT = 'randomuser.me';
  static const VERSION_API = 'api';

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path', params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, '/${Api.VERSION_API}$path');
    http.Response response =
        await http.post(url, body: params, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }
}
