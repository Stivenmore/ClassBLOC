import 'package:bloc_demo/screens/homeintermedium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/login_bloc.dart';

const white = Colors.white;

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(18),
  borderSide: const BorderSide(color: white),
);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.progressin != current.progressin,
      listener: (context, state) {
        switch (state.progressin) {
          case StateProgresion.error:
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error: contacte soporte')));
            Future.delayed(const Duration(seconds: 1), () {
              context.read<LoginBloc>().add(LoginReset());
            });
            break;
          case StateProgresion.success:
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeIntermedium()));
            });
            break;
          default:
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(color: white, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: white,
                  style: const TextStyle(color: white, fontSize: 18),
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: border,
                    hintText: 'UserName',
                    hintStyle: const TextStyle(color: white),
                  ),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginUser(value));
                  },
                  onSaved: (value) {
                    if (value != null) {
                      context.read<LoginBloc>().add(LoginUser(value));
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: white,
                  style: const TextStyle(color: white, fontSize: 18),
                  decoration: InputDecoration(
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: white),
                  ),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginPass(value));
                  },
                  onSaved: (value) {
                    if (value != null) {
                      context.read<LoginBloc>().add(LoginPass(value));
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => context.read<LoginBloc>().add(LoginSubmit()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(16)),
                    height: 50,
                    width: size.width * 0.5,
                    child: const Center(
                      child: Text('Entrar'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
