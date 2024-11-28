
import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String StateName;
  String CityName;
  String image;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.StateName,
        required this.CityName,
      required this.image});

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
        date: data["location"]["localtime"],
        temp: data["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: data["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: data["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        StateName: data["forecast"]["forecastday"][0]["day"]["condition"]
            ["text"],
         CityName:data['location']['name'],
      image:data["forecast"]["forecastday"][0]["day"]["condition"]['icon']
    );
  }
  @override
  String toString() {
    return 'temp=$temp,date=$date,maxTemp=$maxTemp,minTemp=$minTemp,StateName=$StateName)';
  }

  String? getImage() {
    if (StateName == 'Clear' || StateName == 'Light Cloud')
      return 'assets/images/clear.png';
    else if (StateName == 'Sunny')
      return 'assets/images/clear.png';
    else if (StateName == 'Sleet' || StateName == 'Snow' || StateName == 'Hail')
      return 'assets/images/snow.png';
    else if (StateName == 'Heavy Cloud' ||
        StateName == 'Partly Cloudy ' ||
        StateName == 'Snow' ||
        StateName == 'Hail')
      return 'assets/images/cloudy.png';
    else if (StateName == 'Light Rain' ||
        StateName == 'Heavy Rain' ||
        StateName == 'Moderate rain' ||
        StateName == 'Showers')
      return 'assets/images/rainy.png';
    else if (StateName == 'Thunder Storm' || StateName == 'Thunder')
      return 'assets/images/thunderstorm.png';
    else
      return 'assets/images/clear.png';
  }

  MaterialColor getColor() {
    if (StateName == 'Clear' || StateName == 'Light Cloud')
      return Colors.orange;
    else if (StateName == 'Sunny')
      return Colors.yellow;
    else if (StateName == 'Sleet' || StateName == 'Snow' || StateName == 'Hail')
      return Colors.lightBlue;
    else if (StateName == 'Heavy Cloud' ||
        StateName == 'Partly Cloudy ' ||
        StateName == 'Snow' ||
        StateName == 'Hail')
      return Colors.red;
    else if (StateName == 'Light Rain' ||
        StateName == 'Moderate rain' ||
        StateName == 'Heavy Rain' ||
        StateName == 'Showers')
      return Colors.blue;
    else if (StateName == 'Thunder Storm' || StateName == 'Thunder')
      return Colors.teal;
    else
      return Colors.blueGrey;
  }
}
