import 'package:flutter/material.dart';
import 'package:random_user_application/page/random_user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_application/bloc/random_user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RandomUserListBloc(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.purple),
            home: const RandomUserPage()));
  }
}
