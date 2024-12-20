import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:open_weather_app/model/weather_model.dart';

class TodayWeather extends StatefulWidget {
  final WeatherModel? weatherModel;

  const TodayWeather({super.key, this.weatherModel});

  @override
  State<TodayWeather> createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: WeatherType.heavyRainy,
          width: MediaQuery.sizeOf(context).width,
          height: 300,
        )
      ],
    );
  }
}
