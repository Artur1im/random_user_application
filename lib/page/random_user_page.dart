import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_application/bloc/random_user_bloc.dart';
import 'package:random_user_application/widget/custom_card.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomUserPageState createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  final RandomUserListBloc randomUserListBloc = RandomUserListBloc();

  @override
  void initState() {
    randomUserListBloc.add(RandomUserFetchListInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Random person')),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: BlocBuilder<RandomUserListBloc, RandomUserState>(
              bloc: randomUserListBloc,
              builder: (context, state) {
                if (state is RandomUsersFetchingLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is RandomUsersFetchingSuccessfulState) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: randomUserListBloc.randomUsers.length,
                        itemBuilder: (context, index) {
                          final user = state.randomUsers[index];
                          return CustomCard(
                            name: user.name,
                            img: user.picture,
                            phone: user.phone,
                            gender: user.gender,
                            species: user.email,
                          );
                        },
                      ));
                } else {
                  return const Center(
                    child: Text("NOTHING"),
                  );
                }
              },
            ),
          ),
        ));
  }
}

// return SizedBox(
//     height: MediaQuery.of(context).size.height,
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//       children: [
//         Card(
//           clipBehavior: Clip.hardEdge,
//           child: InkWell(
//             splashColor: Colors.blue.withAlpha(30),
//             onTap: () {
//               debugPrint('Card tapped.');
//             },
//             child: const SizedBox(
//               width: 300,
//               height: 100,
//               child: Text('A card that can be tapped'),
//             ),
//           ),
//         ),
//       ],
//     ));
