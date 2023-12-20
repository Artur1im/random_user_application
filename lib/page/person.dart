import 'package:flutter/material.dart';
import 'package:random_user_application/widget/custom_card.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final String img;
  final String phone;
  final String place;
  final String location;
  final String gender;
  final String picture;

  const SecondPage({
    super.key,
    required this.name,
    required this.img,
    required this.phone,
    required this.place,
    required this.location,
    required this.gender,
    required this.picture,
  });

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
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: Image.network(img, fit: BoxFit.fill)),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        UserText('Name:', name),
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
