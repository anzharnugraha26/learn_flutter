import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/models/weather.dart';

class WeatherRepository {
  final String apiKey = 'e4f615bd11fccde94c15855fe99fd06b';
  Future<Weather> fetchWeather(String cityName) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final double temp = data['main']['temp'];
      final String city = data['name'];
      return Weather(cityName: city, temperature: temp);
    } else {
      throw Exception('Gagal Mengambil data cuaca');
    }
  }
}
