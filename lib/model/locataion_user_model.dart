class LocationUserModel {
  String street;
  String city;
  String state;
  String country;
  int postcode;

  LocationUserModel(
      this.street, this.city, this.state, this.country, this.postcode);

  LocationUserModel.fromJson(Map<String, dynamic> data)
      : street = data['street'],
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
