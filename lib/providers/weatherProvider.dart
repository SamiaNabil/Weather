import 'package:flutter/material.dart';
import 'package:weather_app/models/weathermodel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? city_name;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
