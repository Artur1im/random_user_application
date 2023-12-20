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
                          return CardWidget(
                            name: user.name,
                            picture: user.picture,
                            phone: user.phone,
                            place: user.location.city,
                            location: user.location.street,
                            gender: user.gender,
                            age: user.age,
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
