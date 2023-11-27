import 'package:flutter/material.dart';
import 'package:weather_forecast/model/forecast_model.dart';
import 'package:weather_forecast/utils/constants.dart';

class Forecast extends StatelessWidget {
  final List<ForecastModel> model;
  final String languageCode;
  const Forecast({super.key, required this.model, required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 310,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model[index].date),
                    Text(
                      "${languageMap[languageCode]!["minTemp"]}: ${model[index].temperature.minTemp.toStringAsFixed(2)} \u2103",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${languageMap[languageCode]!["maxTemp"]}: ${model[index].temperature.maxTemp.toStringAsFixed(2)} \u2103",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${languageMap[languageCode]!["feelsLike"]}: ${model[index].temperature.feelsLike.toStringAsFixed(2)} \u2103",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
