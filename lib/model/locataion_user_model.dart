class LocationUserModel {
  String location;
  String city;
  String state;
  String country;
  int postcode;

  LocationUserModel(
      this.location, this.city, this.state, this.country, this.postcode);

  LocationUserModel.fromJson(Map<String, dynamic> data)
      : location = '${data['street']['number']} ${data['street']['name']}',
        city = data['city'],
        state = data['state'],
        country = data['country'],
        postcode = data['postcode'];

  static List<LocationUserModel> fromJsonToList(Map<String, dynamic> data) {
    List<LocationUserModel> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(LocationUserModel.fromJson(item));
    }

    return response;
  }
}
