import 'package:random_user_application/model/locataion_user_model.dart';

class RandomUser {
  String gender;
  String name;
  String email;
  LocationUserModel location;
  String phone;
  String picture;
  int age;

  RandomUser(this.gender, this.name, this.location, this.email, this.phone,
      this.picture, this.age);

  RandomUser.fromJson(Map<String, dynamic> data)
      : gender = data['gender'],
        email = data['email'],
        phone = data['phone'],
        picture = data['picture']['medium'],
        age = data['dob']['age'],
        name =
            '${data['name']['title']} ${data['name']['last']} ${data['name']['first']}',
        location = LocationUserModel.fromJson(data['location']);

  static List<RandomUser> fromJsonToList(Map<String, dynamic> data) {
    List<RandomUser> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(RandomUser.fromJson(item));
    }

    return response;
  }
}
