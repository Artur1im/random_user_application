import 'package:random_user_application/api/api.dart';
import 'package:random_user_application/api/api_error.dart';
import 'package:random_user_application/model/random_user_model.dart';

class RandomUserApi extends Api {
  Future<List<RandomUser>> randomUsers({required int count}) async {
    try {
      Map<String, dynamic> data = await get('/', params: {
        'results': count.toString(),
      });

      return RandomUser.fromJsonToList(data);
    } on ApiError catch (_) {
      return [];
    }
  }
}
