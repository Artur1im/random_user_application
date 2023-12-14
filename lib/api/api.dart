import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user_application/api/api_error.dart';
// import 'package:rick_and_morty_app/model/api_error.dart';

class Api {
  // ignore: constant_identifier_names
  static const ENDPOINT = 'randomuser.me/api';
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> get(String method, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, method, params);
    http.Response response = await http.get(url, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }

  Future<dynamic> post(String method, {Map<String, dynamic>? params}) async {
    Uri url = Uri.https(ENDPOINT, method);
    http.Response response =
        await http.post(url, body: params, headers: _headers);
    Map<String, dynamic> content = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ApiError(response.statusCode, content.toString());
    }
    return content;
  }
}
