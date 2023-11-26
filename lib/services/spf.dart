import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/model/forecast_model.dart';

class SpfService {
  final locationKey = "location";
  final forecastDataKey = "forecastData";
  final lastUpdateKey = "lastUpdate";
  final selectedLanguageKey = "languageCode";

  //++++++++++++ Location ============================
  Future<void> saveLocation(String location) async {
    final spf = await SharedPreferences.getInstance();
    spf.setString(locationKey, location);
  }

  Future<String> getLocation() async {
    final spf = await SharedPreferences.getInstance();
    return spf.getString(locationKey) ?? '';
  }

  //================ Forecast Data =========================
  Future<void> saveForecastData(List<ForecastModel> value) async {
    final spf = await SharedPreferences.getInstance();
    List<String> data = [];
    for (ForecastModel model in value) {
      data.add(jsonEncode(model));
    }
    spf.setStringList(forecastDataKey, data);
  }

  Future<List<ForecastModel>> getForecastData() async {
    final spf = await SharedPreferences.getInstance();
    List<String>? data = spf.getStringList(forecastDataKey);
    List<ForecastModel> model = [];
    if (data != null) {
      for (String str in data) {
        model.add(jsonDecode(str));
      }
    }
    return model;
  }

  //================= Last Update =============================
  Future<void> saveLastUpdate(String dateTime) async {
    final spf = await SharedPreferences.getInstance();
    spf.setString(lastUpdateKey, dateTime);
  }

  Future<String?> getLastUpdate() async {
    final spf = await SharedPreferences.getInstance();
    return spf.getString(lastUpdateKey);
  }

  //============ Language Code ===============================
  Future<void> saveLanguageCode(String value) async {
    final spf = await SharedPreferences.getInstance();
    spf.setString(selectedLanguageKey, value);
  }

  Future<String> getLanguageCode() async {
    final spf = await SharedPreferences.getInstance();
    return spf.getString(selectedLanguageKey) ?? 'en';
  }
}
