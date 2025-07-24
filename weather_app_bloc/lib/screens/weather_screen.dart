import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_event.dart';
import 'package:weather_app_bloc/bloc/weather_state.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Cuaca'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                  labelText: 'Nama Kota', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  final city = cityController.text;
                  if (city.isNotEmpty) {
                    weatherBloc.add(FetchWeather(city));
                  }
                },
                child: const Text('Cek Cuaca')),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
              if (state is WeatherInitial) {
                return const Text('Masukan nama kota untuk melihat cuaca');
              } else if (state is WeatherLoading) {
                return const CircularProgressIndicator();
              } else if (state is WeatherLoaded) {
                return Column(
                  children: [
                    Text(
                      "Cuaca di ${state.weather.cityName}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${state.weather.temperature.toStringAsFixed(1)}C",
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              } else if (state is WeatherError) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
          ],
        ),
      ),
    );
  }
}
