import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perbedaan_cubit_bloc/bloc/counter_bloc.dart';
import 'package:perbedaan_cubit_bloc/cubit/counter_cubit.dart';
import 'package:perbedaan_cubit_bloc/screens/counter_bloc_screen.dart';
import 'package:perbedaan_cubit_bloc/screens/counter_cubit_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        // version cubit
        // create: (_) => CounterCubit(),
        // child: const CounterCubitScreen(),

        // version bloc
        create: (_) => CounterBloc(),
        child: const CounterBlocScreen(),
      ),
    );
  }
}
