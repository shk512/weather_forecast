import 'package:weather_forecast/model/temp_model.dart';
import 'package:weather_forecast/model/weather_model.dart';

class ForecastModel {
  final TempModel temperature;
  final WeatherModel weather;
  final int cloudiness;
  final int visibility;
  final bool isDay;
  final String date;
  ForecastModel({
    required this.weather,
    required this.temperature,
    required this.cloudiness,
    required this.visibility,
    required this.date,
    required this.isDay,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> mapData) {
    return ForecastModel(
      weather: WeatherModel.fromJson(mapData["weather"][0]),
      temperature: TempModel.fromJson(mapData["main"]),
      cloudiness: mapData["clouds"]["all"],
      visibility: mapData["visibility"],
      date: mapData["dt_txt"],
      isDay: mapData["sys"]["pod"] == "n" ? false : true,
    );
  }
}
