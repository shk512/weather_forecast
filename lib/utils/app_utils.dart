import 'package:weather_forecast/utils/constants.dart';

class AppUtils {
  static String lastUpdateTime = "";

  static String getImagePathByWeatherType(String weather) {
    String path;
    if (weather == 'Rain') {
      path = rainy;
    } else if (weather == "Clouds") {
      path = cloudy;
    } else if (weather == "Snow") {
      path = snow;
    } else if (weather == "Thunderstorm") {
      path = stormy;
    } else if (weather == "Sunny") {
      path = sunny;
    } else {
      path = clear;
    }
    return path;
  }
}
