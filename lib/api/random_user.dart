import 'dart:developer';

import 'package:random_user_application/api/api.dart';
import 'package:random_user_application/api/api_error.dart';
import 'package:random_user_application/model/random_user_model.dart';

class ApiCharacter extends Api {
  Future<List<RandomUser>> randomUser({
    int page = 1,
    String? name,
    String? status,
  }) async {
    try {
      Map<String, dynamic> data = await get('/api', params: {
        'page': page.toString(),
        'name': name,
        'status': status,
      });
      return RandomUser.fromJsonToList(data);
    } on ApiError catch (_) {
      return [];
    }
  }
}
