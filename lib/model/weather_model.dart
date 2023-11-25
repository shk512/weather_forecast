class WeatherModel {
  final String weather;
  final String description;
  WeatherModel({required this.description, required this.weather});

  factory WeatherModel.fromJson(Map<String, dynamic> mapData) {
    return WeatherModel(
      description: mapData["description"],
      weather: mapData["main"],
    );
  }
}
