import 'package:flutter/material.dart';
import 'package:perbedaan_cubit_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Center'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
            builder: (context, count) => Text(
                  '$count',
                  style: const TextStyle(fontSize: 40),
                )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterCubit.increment,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: counterCubit.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
