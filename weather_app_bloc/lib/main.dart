import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/repositories/weather_repository.dart';
import 'package:weather_app_bloc/screens/weather_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherRepository repository = WeatherRepository();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (_) => WeatherBloc(repository),
      child: WeatherScreen(),
      ),
    );
  }
}
