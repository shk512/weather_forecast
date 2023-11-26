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
      temp: mapData["temp"] - 273.15,
      feelsLike: mapData["feels_like"] - 273.15,
      humidity: mapData["humidity"],
      maxTemp: mapData["temp_max"] - 273.15,
      minTemp: mapData["temp_min"] - 273.15,
    );
  }
}
