import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/screens/SearchPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
// void updateUi(){
//   setState(() {
//   });
// }
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context,listen: false).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<WeatherProvider>(context).weatherData==null?Colors.blue: Provider.of<WeatherProvider>(context).weatherData!.getColor(),
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              
              );
            },
          ),
        ],
      ),
      body: weatherData == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text('there is no weather start searching now',
                      style: TextStyle(color: Colors.black, fontSize: 30)),
                ),
              ],
            )
          : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                weatherData!.getColor(),
                weatherData!.getColor()[300]!,
                weatherData!.getColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              ),
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<WeatherProvider>(context).city_name!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Updated :${weatherData!.date}",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Image.network("${weatherData!.image}"),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "${weatherData!.temp.toInt()}",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text("max: ${weatherData!.maxTemp.toInt()}"),
                          Text("min: ${weatherData!.minTemp.toInt()}"),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    weatherData!.StateName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
