import 'dart:convert';

import 'package:http/http.dart' ;
import 'package:weather_app/models/weathermodel.dart';

class WeatherService {
  String base = 'http://api.weatherapi.com/v1/';
  String key = 'ccdb2c9d9da745e19c5153742240909';
  Future<WeatherModel?> getWeather({String? city_name}) async {
    try {
      WeatherModel weatherData;
      Uri url = Uri.parse('$base/forecast.json?key=$key&q=$city_name&days=7');
      Response response = await get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherData = WeatherModel.fromJson(data);
      return weatherData;
    } catch (e) {
      print(e);
    }
  }
}
