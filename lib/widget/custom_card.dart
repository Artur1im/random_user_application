import 'package:flutter/material.dart';
import 'package:random_user_application/page/person.dart';

// class CustomCard extends StatelessWidget {
//   final String name;
//   final String img;
//   final String phone;
//   final String place;

//   const CustomCard({
//     super.key,
//     required this.name,
//     required this.img,
//     required this.phone,
//     required this.place,
//   });
//   @override
//   Widget build(BuildContext context) {
//     //   return InkWell(
//     //     onTap
//     //   );
//     // }

//     return
//   }
// }

class CardWidget extends StatelessWidget {
  final String name;
  final String img;
  final String phone;
  final String place;

  const CardWidget({
    super.key,
    required this.name,
    required this.img,
    required this.phone,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // При нажатии на карточку, вызовите метод для перехода на новую страницу
          _navigateToDetailsPage(context);
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
                        height: 100, width: 100, child: Image.network(img))),
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

  void _navigateToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Person(
          name: name,
          img: img,
          phone: phone,
          place: place,
        ),
      ),
    );
  }
}
