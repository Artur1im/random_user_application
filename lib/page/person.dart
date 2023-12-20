import 'package:flutter/material.dart';
import 'package:random_user_application/widget/custom_card.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final String phone;
  final String place;
  final String location;
  final String gender;
  final String picture;
  final int age;

  const SecondPage(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вторая страница'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.network(picture, fit: BoxFit.cover),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            UserText('Name:', name),
                            UserText(
                              'Name:',
                              '$age',
                            ),
                            UserText('$age', '$age')
                          ],
                        ),
                        UserText('Location:', location),
                        UserText('Gender:', gender),
                        UserText('Phone:', phone),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
