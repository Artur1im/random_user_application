class LocationUserModel {
  String street;
  String city;
  String state;
  String country;
  String postcode;

  LocationUserModel.fromJson(Map<String, dynamic> data)
      : street = '${data['street']['number']} ${data['street']['name']}',
        city = data['city'],
        state = data['state'],
        country = data['country'],
        postcode = data['postcode'].toString();
}

// удалить самообнавление