import 'package:flutter/material.dart';
import 'package:weather_forecast/view_model/forecast_view_model.dart';

class LastUpdateTime extends StatelessWidget {
  const LastUpdateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ForecastViewModel().getLastUpdateTime(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return const Text("Today");
          }
        });
  }
}
