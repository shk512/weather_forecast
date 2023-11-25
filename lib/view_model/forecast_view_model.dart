import 'package:weather_forecast/model/forecast_model.dart';
import 'package:weather_forecast/model/location_model.dart';
import 'package:weather_forecast/services/api.dart';
import 'package:weather_forecast/services/geo_location.dart';

class ForecastViewModel {
  Future<ForecastModel> getForecast() async {
    LocationModel location = await GeoLocationService().getCurrentLocation();
    Map<String, dynamic>? mapData = await ApiServices()
        .getWeatherForecast(lat: location.lat, lng: location.lng);
    if (mapData != null) {}
    return ForecastModel.fromJson(mapData!["list"]);
  }
}
