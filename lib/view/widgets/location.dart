import 'package:flutter/material.dart';
import 'package:weather_forecast/view_model/forecast_view_model.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ForecastViewModel().getLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
