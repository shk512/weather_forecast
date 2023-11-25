class TempModel {
  final double temp;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;
  final int humidity;
  TempModel({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
  });

  factory TempModel.fromJson(Map<String, dynamic> mapData) {
    return TempModel(
      temp: mapData["temp"],
      feelsLike: mapData["feels_like"],
      humidity: mapData["humidity"],
      maxTemp: mapData["temp_max"],
      minTemp: mapData["temp_min"],
    );
  }
}
