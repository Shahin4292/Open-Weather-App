import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_app/model/weather_model.dart';

class TodayWeather extends StatelessWidget {
  final WeatherModel? weatherModel;

  const TodayWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        WeatherBg(
          weatherType: WeatherType.heavyRainy,
          width: size.width,
          height: size.height * 0.3,
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.3,
          child: Column(
            children: [
              Text(
                weatherModel?.location?.name ?? "",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                  DateFormat.yMMMMEEEEd().format(DateTime.parse(
                      weatherModel?.current?.lastUpdated.toString() ?? "")),
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}
