import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/utils/constants.dart';

class ApiServices {
  Future<Map<String, dynamic>?> getWeatherForecast(
      {required double lat, required double lng}) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lng&appid=$weatherApiKey");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["cod"] == "200") {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
}
