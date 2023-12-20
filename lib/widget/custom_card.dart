import 'package:flutter/material.dart';
import 'package:random_user_application/page/person.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String place;
  final String location;
  final String gender;
  final String picture;
  final int age;

  const CardWidget(
      {super.key,
      required this.name,
      required this.phone,
      required this.place,
      required this.location,
      required this.gender,
      required this.picture,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(
                name: name,
                picture: picture,
                phone: phone,
                place: place,
                location: location,
                gender: gender,
                age: age,
              ),
            ),
          );
        },
        child: Card(
            child: SizedBox(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              color: const Color.fromRGBO(249, 249, 249, 1),
              child: Row(children: [
                Container(
                    margin: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(picture))),
                Expanded(
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.only(right: 10, top: 30),
                    child: Column(
                      children: [
                        Text('Place: $place'),
                        Text(
                          name,
                          style: const TextStyle(fontSize: 17),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'phone: $phone',
                              style: const TextStyle(fontSize: 16),
                            ))
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        )));
  }
}

class UserText extends StatelessWidget {
  final String titleOne;
  final String titleTwo;

  const UserText(this.titleOne, this.titleTwo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleOne,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          titleTwo,
        )
      ],
    );
  }
}
