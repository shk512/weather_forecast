import 'package:flutter/material.dart';
import 'package:weather_forecast/model/forecast_model.dart';
import 'package:weather_forecast/view/widgets/background.dart';
import 'package:weather_forecast/view_model/forecast_view_model.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder<ForecastModel>(
          future: ForecastViewModel().getForecast(),
          builder: (context, AsyncSnapshot response) {
            if (response == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!response.hasData) {
              return const Center(
                child: Text("No Data Found"),
              );
            }
            if (response.hasError) {
              return const Center(
                child: Text(
                  "Something Error\nTry Again Later",
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return Background(
                weather: response.data.weather.weather,
                child: Column(
                  children: [],
                ),
              );
            }
          }),
    );
  }
}
