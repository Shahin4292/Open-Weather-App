import 'package:flutter/material.dart';
import 'package:open_weather_app/services/api_service.dart';
import 'package:open_weather_app/ui/components/today_weather.dart';

import '../model/weather_model.dart';
import 'components/hourly_weather_listitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiService.getWeatherData("Dhaka"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Column(
                children: [
                  TodayWeather(
                    weatherModel: weatherModel,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    "Weather By Hours",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        Hour? hour = weatherModel
                            ?.forecast?.forecastday?[0].hour?[index];

                        return HourlyWeatherListItem(
                          hour: hour,
                        );
                      },
                      itemCount: weatherModel
                          ?.forecast?.forecastday?[0].hour?.length ??
                          0,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error has occurred"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
