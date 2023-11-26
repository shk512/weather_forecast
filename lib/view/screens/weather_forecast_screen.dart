import 'package:flutter/material.dart';
import 'package:weather_forecast/model/city_model.dart';
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
          "Weather Forecast",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: FutureBuilder<ForecastModel?>(
          future: ForecastViewModel().getForecast(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data Found"),
              );
            }
            if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                child: Text(
                  "Something Error\nTry Again Later",
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return Background(
                weather: snapshot.data.weather.weather,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${CityModel.city}, ${CityModel.country}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
