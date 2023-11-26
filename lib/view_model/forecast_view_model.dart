import 'package:weather_forecast/model/city_model.dart';
import 'package:weather_forecast/model/forecast_model.dart';
import 'package:weather_forecast/services/api.dart';
import 'package:weather_forecast/services/geo_location.dart';

class ForecastViewModel {
  Future<ForecastModel?> getForecast() async {
    ForecastModel? forecastModel;
    await GeoLocationService().getCurrentLocation().then((location) async {
      await ApiServices()
          .getWeatherForecast(lat: location.lat, lng: location.lng)
          .then((mapData) {
        if (mapData != null) {
          forecastModel = ForecastModel.fromJson(mapData["list"][0]);
          CityModel.city = mapData["city"]["name"];
          CityModel.country = mapData["city"]["country"];
        }
      });
    });

    return forecastModel;
  }
}
