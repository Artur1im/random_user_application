import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_application/bloc/random_user_bloc.dart';
import 'package:random_user_application/widget/custom_card.dart';

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonState createState() => _PersonState();
}

@override
State<Person> createState() => _PersonState();
final RandomUserListBloc randomUserListBloc = RandomUserListBloc();

class _PersonState extends State<Person> {
  final RandomUserListBloc randomUserListBloc = RandomUserListBloc();

  @override
  void initState() {
    randomUserListBloc.add(RandomUserFetchListInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                          img: user.picture,
                          phone: user.phone,
                          place: user.location.city,
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
      ),
    );
  }
}
