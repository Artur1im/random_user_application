class RandomUser {
  int id;
  String name;
  String status;
  String image;
  String gender;
  String species;

  RandomUser(
      this.id, this.name, this.status, this.image, this.gender, this.species);

  RandomUser.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        status = data['status'],
        image = data['image'],
        species = data['species'],
        gender = data['gender'];

  static List<RandomUser> fromJsonToList(Map<String, dynamic> data) {
    List<RandomUser> response = [];
    for (Map<String, dynamic> item in data['results']) {
      response.add(RandomUser.fromJson(item));
    }

    return response;
  }
}
