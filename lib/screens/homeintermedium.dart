import 'package:bloc_demo/bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeIntermedium extends StatefulWidget {
  const HomeIntermedium({super.key});

  @override
  State<HomeIntermedium> createState() => _HomeIntermediumState();
}

class _HomeIntermediumState extends State<HomeIntermedium> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listenWhen: (previous, current) => previous.value != current.value,
      listener: (context, state) {
        if (state.alert) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Estamos con valores negativos')));
        }
      },
      buildWhen: (previous, current) => previous.value > 4 && current.value > 4,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: SizedBox(
            height: 200,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterAdd());
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterRemove());
                  },
                  child: const Icon(Icons.remove),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Counter'),
                Text(
                  state.value.toString(),
                  style: const TextStyle(fontSize: 26),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
