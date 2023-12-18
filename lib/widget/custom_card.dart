import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String img;
  final String phone;
  final String gender;
  final String species;

  const CustomCard(
      {super.key,
      required this.name,
      required this.img,
      required this.phone,
      required this.gender,
      required this.species});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      color: Colors.grey,
                      spreadRadius: 1,
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
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Column(
                  children: [
                    Text(gender),
                    Text(species),
                    Text(
                      name,
                      style:
                          const TextStyle(fontFamily: 'fontRick', fontSize: 19),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          phone,
                          style: const TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
