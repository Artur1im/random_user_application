import 'package:random_user_application/model/locataion_user_model.dart';

class RandomUser {
  String gender;
  String name;
  double email;
  LocationUserModel location;
  int phone;
  String picture;

  RandomUser(this.gender, this.name, this.location, this.email, this.phone,
      this.picture);

  RandomUser.fromJson(Map<String, dynamic> data)
      : gender = data['gender'],
        email = data['email'],
        phone = data['phone'],
        picture = data['picture'],
        name =
            '${data['name']['title']} ${data['name']['last']} ${data['name']['first']}',
        location = LocationUserModel.fromJson(
          data['location'],
        );

  static List<RandomUser> fromJsonToList(Map<String, dynamic> data) {
    List<RandomUser> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(RandomUser.fromJson(item));
    }

    return response;
  }
}
