import 'package:flutter/material.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/screens/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
     create: (context) {
        return WeatherProvider();
      },

    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData==null?Colors.blue: Provider.of<WeatherProvider>(context).weatherData!.getColor()
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
