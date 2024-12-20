import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_app/model/weather_model.dart';

class FutureForcastListitem extends StatelessWidget {
  final Forecastday? forecastday;

  const FutureForcastListitem({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.all(8),
      width: size.width,
      child: Row(
        children: [
          Image.network("https:${forecastday?.day?.condition?.icon ?? ""}"),
          Text(
            DateFormat.MMMEd()
                .format(DateTime.parse(forecastday?.date.toString() ?? "")),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
