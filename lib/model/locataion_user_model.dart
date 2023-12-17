class LocationUserModel {
  int id;
  String name;
  String status;
  String image;
  String gender;
  String species;

  LocationUserModel(
      this.id, this.name, this.status, this.image, this.gender, this.species);

  LocationUserModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = '${data['name']['first']} ${data['name']['last']}',
        status = data['status'],
        image = data['image'],
        species = data['species'],
        gender = data['gender'];

  static List<LocationUserModel> fromJsonToList(Map<String, dynamic> data) {
    List<LocationUserModel> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(LocationUserModel.fromJson(item));
    }

    return response;
  }
}
