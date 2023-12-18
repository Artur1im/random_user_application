import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final String name;
  final String img;
  final String phone;
  final String place;

  Person({
    super.key,
    required this.name,
    required this.img,
    required this.phone,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(cardTitle),
          ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
