import 'package:bloc_demo/bloc/bloc/counter_bloc.dart';
import 'package:bloc_demo/bloc/bloc/login_bloc.dart';
import 'package:bloc_demo/data/user_repo.dart';
import 'package:bloc_demo/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) =>
                LoginBloc(RepositoryProvider.of<UserRepo>(context)),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BLOC',
            home: LoginScreen()),
      ),
    );
  }
}
