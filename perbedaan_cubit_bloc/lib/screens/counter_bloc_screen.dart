import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perbedaan_cubit_bloc/bloc/counter_bloc.dart';
import 'package:perbedaan_cubit_bloc/bloc/counter_event.dart';
import 'package:perbedaan_cubit_bloc/bloc/counter_state.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Center'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) => Text(
                  '${state.count}',
                  style: const TextStyle(fontSize: 40),
                )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(IncrementCounter()),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(DecrementCounter()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
