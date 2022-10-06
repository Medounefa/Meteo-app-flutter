import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:meteo_test/model/weather-model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=fcecac93ea274f6cb7ee25da98547e6f&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // Weather weather = Weather.fromJson(body);
    // ignore: avoid_print
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
