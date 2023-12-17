import 'package:random_user_application/model/locataion_user_model.dart';

class RandomUser {
  int id;
  String name;
  String status;
  String image;
  String gender;
  String species;
  LocationUserModel location;

  RandomUser.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = '${data['name']['first']} ${data['name']['last']}',
        status = data['status'],
        image = data['image'],
        species = data['species'],
        gender = data['gender'],
        location = LocationUserModel.fromJson(data['location']);

  static List<RandomUser> fromJsonToList(Map<String, dynamic> data) {
    List<RandomUser> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(RandomUser.fromJson(item));
    }

    return response;
  }
}
