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
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10))),
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
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white10,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                              "https:${weatherModel?.current?.condition?.icon ?? ""}"),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                weatherModel?.current?.tempC
                                    ?.round()
                                    .toString() ??
                                    "",
                                style: const TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ),
                            const Text(
                              'o',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink
                                //foreground: Paint()..shader = shader,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          weatherModel?.current?.condition?.text ?? "",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            //foreground: Paint()..shader = shader,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //Spacer()
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
