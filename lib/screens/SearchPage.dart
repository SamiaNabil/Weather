import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/services/weatherservice.dart';

class SearchPage extends StatelessWidget {
  // SearchPage({this.updateUi});
  String? cityName;
  // Function? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "Search A City",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                try {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(city_name: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context,listen: false).city_name = cityName;
                  // updateUi = updateUi;
                  
                  Navigator.pop(context);
                  // updateUi!();
                } on Exception catch (e) {
                  print(e);
                }
                // updateUi = updateUi;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                labelStyle: TextStyle(fontSize: 20),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                hintText: "enter a city name",
                suffixIcon: GestureDetector(
                  onTap: () async {
                    
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(city_name: cityName!);
                      Provider.of<WeatherProvider>(context,listen: false).weatherData =
                          weather;
                      Provider.of<WeatherProvider>(context,listen: false).city_name =
                          cityName;
                      // updateUi = updateUi;
                      // updateUi!();
                      Navigator.pop(context);
                    
                    
          
                    
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
